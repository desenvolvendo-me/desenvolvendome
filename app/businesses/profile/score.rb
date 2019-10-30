class Profile::Score

  def initialize(user)
    @user = user
    @score = 0
  end

  def run
    have_experience_greater_than_75
    influencer
    update_score
  end

  private

  def update_score
    @user.profile.update(score: @score)
  end

  def have_experience_greater_than_75
    @score += 2 * @user.profile.knowledges.where("experience >= 75").count
  end

  def influencer
    @score += Evaluation::Influencer.new(@user).score
  end

end
