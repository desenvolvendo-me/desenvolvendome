class Profile::Score

  def initialize
    @score = 0
  end

  def run(user)
    have_experience_greater_than_75(user)
    update_score(user)
  end

  private

  def update_score(user)
    user.profile.update(score: @score)
  end

  def have_experience_greater_than_75(user)
    @score += 2 * user.profile.knowledges.where("experience >= 75").count
  end

end
