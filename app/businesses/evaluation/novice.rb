class Evaluation::Novice

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    commits = count_commits
    repositories = count_repositories
    (commits - 150) / 15 if commits <= 300 and repositories >= 3
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
    @user.repositories.where("commits_count >= 50").count
  end

end
