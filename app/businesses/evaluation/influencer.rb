class Evaluation::Influencer

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    case @user.followers
    when 0..100
      level = 0
    when 101..200
      level = 1
    when 201..300
      level = 2
    when 301..400
      level = 3
    when 401..500
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

  def create_evaluation
    evaludation = @user.profile.evaluations.where(evaluation_type: :influencer).take
    if evaludation
      evaludation.update(level: level)
    else
      Evaluation.create(level: level, evaluation_type: :influencer, profile: @user.profile)
    end
  end

end
