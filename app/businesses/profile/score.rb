class Profile::Score

  def initialize(user)
    @user = user
    @score = 0
  end

  def run
    programmer
    influencer
    collaborator
    update_score
  end

  private

  def collaborator
    @score += Evaluation::Collaborator.new(@user).score
  end

  def programmer
    @score += Evaluation::Programmer.new(@user).score
  end

  def influencer
    @score += Evaluation::Influencer.new(@user).score
  end

  def update_score
    @user.profile.update(score: @score.round(2))
  end

end
