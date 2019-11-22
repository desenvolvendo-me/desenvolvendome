class Evaluation::Started

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    lv = 0
    lv = 1 + (count_commits / 15) unless up?

    lv = 10 if count_commits >= 150
    lv
  end

  def up?
    (count_repositories >= 3 and count_commits >= 150)
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

  def count_commits
    @user.repositories.sum(:commits_count)
  end

  def count_repositories
    @user.repositories.where("commits_count >= 50").count
  end

end
