class Evaluation::Knight
  DESCRIPTION_MAX_LEVEL = "MÁXIMO NÍVEL"
  SETTING = {min_level: 1, max_level: 10, role: {kind: :knight, calc: 300, repositories: 3, commits: 3000, repository_size: 500, commits_preview: 300}}

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    lv = SETTING[:min_level] + ((commits - SETTING[:role][:commits_preview]) / SETTING[:role][:calc]) unless up?
    lv = SETTING[:max_level] if max
    lv
  end

  def up?
    false
  end

  def next_level
    level = {number: 0, percentage: 0}
    level[:number] = max ? DESCRIPTION_MAX_LEVEL : "+#{xp_next_level}"
    level[:percentage] = max ? 100 : (1 - (xp_next_level.to_f / SETTING[:role][:calc].to_f)) * 100
    level
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: SETTING[:role][:kind])
    else
      Evaluation.create(level: level, evaluation_type: SETTING[:role][:kind], profile: @user.profile)
    end
  end

  def commits
    @user.repositories.sum(:commits_count)
  end

  def repositories
    @user.repositories.where("commits_count >= #{SETTING[:role][:repository_size]}").count
  end

  def xp_next_level
    SETTING[:role][:calc] - (commits % SETTING[:role][:calc])
  end

  def max
    commits >= SETTING[:role][:commits]
  end

end
