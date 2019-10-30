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
    @score += (0.2 * Evaluation::Influencer.new.level(user))
  end

end
