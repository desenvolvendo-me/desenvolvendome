class Evaluation::Kind
  DESCRIPTION_MAX_LEVEL = "MÁXIMO NÍVEL"
  @setting = {}

  def initialize(user, setting)
    @setting = setting
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    lv = @setting[:min_level] + ((commits - @setting[:role][:commits_preview]) / @setting[:role][:calc]) unless up?
    lv = @setting[:max_level] if max
    lv
  end

  def up?
    (repositories >= @setting[:role][:level_up][:repositories] and commits >= @setting[:role][:level_up][:commits])
  end

  def next_level
    level = {number: 0, percentage: 0}
    level[:number] = max ? DESCRIPTION_MAX_LEVEL : "+#{xp_next_level}"
    level[:percentage] = max ? 100 : (1 - (xp_next_level.to_f / @setting[:role][:calc].to_f)) * 100
    level
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: @setting[:role][:kind])
    else
      Evaluation.create(level: level, evaluation_type: @setting[:role][:kind], profile: @user.profile)
    end
  end

  def commits
    @user.repositories.sum(:commits_count)
  end

  def repositories
    @user.repositories.where("commits_count >= #{@setting[:role][:repository_size]}").count
  end

  def xp_next_level
    @setting[:role][:calc] - (commits % @setting[:role][:calc])
  end

  def max
    commits >= @setting[:role][:level_up][:commits]
  end

end
