class Evaluation::Knight

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    commits = count_commits
    repositories = count_repositories
    commits / 300 if commits <= 3000 and repositories >= 3
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
    @user.repositories.where("commits_count >= 100").count
  end

end
