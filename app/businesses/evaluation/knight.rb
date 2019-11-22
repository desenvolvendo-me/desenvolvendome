class Evaluation::Knight

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    lv = 0
    lv = count_commits / 300 unless up?
    lv = 10 if count_commits >= 3000
    lv
  end

  def up?
    (count_repositories >= 3 and count_commits >= 3000)
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: :knight)
    else
      Evaluation.create(level: level, evaluation_type: :knight, profile: @user.profile)
    end
  end

  def count_commits
    @user.repositories.sum(:commits_count)
  end

  def count_repositories
    @user.repositories.where("commits_count >= 500").count
  end

end
