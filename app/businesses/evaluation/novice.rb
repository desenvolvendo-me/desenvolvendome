class Evaluation::Novice

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation unless up?
  end

  def level
    ((count_commits - 150) / 15) + 1 unless up?
  end

  def up?
    (count_repositories >= 3 and count_commits.between?(300, 3000))
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: :novice)
    else
      Evaluation.create(level: level, evaluation_type: :novice, profile: @user.profile)
    end
  end

  def count_commits
    @user.repositories.sum(:commits_count)
  end

  def count_repositories
    @user.repositories.where("commits_count >= 100").count
  end

end
