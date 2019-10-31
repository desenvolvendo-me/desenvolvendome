class Evaluation::Collaborator

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    case stargazers_index
    when 0
      level = 0
    when 1..2
      level = 1
    when 2..3
      level = 2
    when 3..4
      level = 3
    when 4..5
      level = 4
    else
      level = 5
    end
    level
  end

  def score
    0.2 * level
  end

  private

  def stargazers_index
    index = 0
    repositories = @user.repositories

    stargazers_50 = repositories.where("stargazers_count >= 50").count
    stargazers_100 = repositories.where("stargazers_count >= 100").count
    stargazers_500 = repositories.where("stargazers_count >= 500").count
    stargazers_1000 = repositories.where("stargazers_count >= 1000").count
    stargazers_5000 = repositories.where("stargazers_count >= 5000").count

    if stargazers_50 > 0
      index = 1 + (0.1 * stargazers_50)
    elsif stargazers_100 > 0
      index = 2 + (0.2 * stargazers_100)
    elsif stargazers_500 > 0
      index = 3 + (0.3 * stargazers_500)
    elsif stargazers_1000 > 0
      index = 4 + (0.4 * stargazers_1000)
    elsif stargazers_5000 > 0
      index = 5 + (0.5 * stargazers_5000)
    end
    index
  end

  def create_evaluation
    evaludation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
    if evaludation
      evaludation.update(level: level)
    else
      Evaluation.create(level: level, evaluation_type: :collaborator, profile: @user.profile)
    end
  end

end
