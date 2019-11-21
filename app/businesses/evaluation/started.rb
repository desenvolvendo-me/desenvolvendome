class Evaluation::Started

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    number = count_commits
    number / 15 if number <= 150
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level)
    else
      Evaluation.create(level: level, evaluation_type: :started, profile: @user.profile)
    end
  end

  def count_commits
    @user.repositories.sum(:commits_count)
  end

end
