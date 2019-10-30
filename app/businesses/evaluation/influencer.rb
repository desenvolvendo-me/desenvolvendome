class Evaluation::Influencer

  def initialize(args = {})
  end

  def run(user)
    create_evaluation(user)
  end

  def level(user)
    case user.followers
    when 0..50
      level = 1
    when 51..100
      level = 2
    when 101..150
      level = 3
    when 151..200
      level = 4
    else
      level = 5
    end
    level
  end

  private

  def create_evaluation(user)
    evaludation = user.profile.evaluations.where(evaluation_type: :influencer).take
    if evaludation
      evaludation.update(level: level(user))
    else
      Evaluation.create(level: level(user), evaluation_type: :influencer, profile: user.profile)
    end
  end

end
