class Evaluation::Programmer

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    case @user.profile.knowledges.where("experience >= 75").count
    when 1
      level = 1
    when 2
      level = 2
    when 3
      level = 3
    when 4
      level = 4
    else
      level = 5
    end
    level
  end

  def score
    1 * level
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluations.where(evaluation_type: :programmer).take
    if evaludation
      evaludation.update(level: level)
    else
      Evaluation.create(level: level, evaluation_type: :programmer, profile: @user.profile)
    end
  end

end
