class Profile::Followers

  def initialize(args = {})
  end

  def run(user)
    set_influencer(user)
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

  def set_influencer(user)
    evaludation = user.profile.evaluations.where(evaluation_type: :influencer).take
    if evaludation
      evaludation.update(level: level(user))
    else
      Evaluation.create(level: level(user), evaluation_type: :influencer, profile: user.profile)
    end
  end

end
