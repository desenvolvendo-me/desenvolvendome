class Profile::Followers

  def initialize(args = {})
  end

  def run(user)
    user.profile.evaluations << Evaluation.create(level: level(user), evaluation_type: :influence_digital)
    user.profile.save
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

end
