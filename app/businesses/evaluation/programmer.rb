class Evaluation::Programmer

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    without_basic_knowledges = @user.profile.knowledges.joins(:language).where("languages.description NOT IN (?)", %w(CSS HTML))
    case without_basic_knowledges.where("experience >= 33").count
    when 0
      level = 0
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
