class Profile::Score

  def initialize
    @score = 0
  end

  def run(user)
    have_experience_greater_than_75(user)
    how_many_followers(user)
    update_score(user)
  end

  private

  def update_score(user)
    user.profile.update(score: @score)
  end

  def have_experience_greater_than_75(user)
    @score += 2 * user.profile.knowledges.where("experience >= 75").count
  end

  def how_many_followers(user)
    case user.followers
    when 0..50
      user.profile.evaluations << Evaluation.create(level: 1, evaluation_type: :influence_digital)
      @score += 0.2
    when 51..100
      user.profile.evaluations << Evaluation.create(level: 2, evaluation_type: :influence_digital)
      @score += 0.4
    when 101..150
      user.profile.evaluations << Evaluation.create(level: 3, evaluation_type: :influence_digital)
      @score += 0.6
    when 151..200
      user.profile.evaluations << Evaluation.create(level: 4, evaluation_type: :influence_digital)
      @score += 0.6
    else
      user.profile.evaluations << Evaluation.create(level: 5, evaluation_type: :influence_digital)
      @score += 1
    end
  end

end
