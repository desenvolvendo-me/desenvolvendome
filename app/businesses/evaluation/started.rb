class Evaluation::Started

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    lv = 0
    lv = 1 + (commits / role[:calc]) unless up?
    lv = 10 if max
    lv
  end

  def up?
    (repositories >= role[:repositories] and commits >= role[:commits])
  end

  def next_level
    level = {number: 0, percentage: 0}
    level[:number] = max ? "MÁXIMO NÍVEL" : "+#{xp_next_level}"
    level[:percentage] = max ? 100 : (1 - (xp_next_level.to_f / role[:calc].to_f)) * 100
    level
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: :started)
    else
      Evaluation.create(level: level, evaluation_type: :started, profile: @user.profile)
    end
  end

  def commits
    @user.repositories.sum(:commits_count)
  end

  def repositories
    @user.repositories.where("commits_count >= #{role[:repository_size]}").count
  end

  def xp_next_level
    role[:calc] - (commits % role[:calc])
  end

  def max
    commits >= role[:commits]
  end

  def role
    {calc: 15, repositories: 3, commits: 150, repository_size: 50}
  end

end
