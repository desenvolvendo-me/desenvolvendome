class Profile::Score

  def initialize(user)
    @user = user
    @score = 0
  end

  def run
    disciplinarian
    programmer
    collaborator
    influencer
    update_score
  end

  private

  def programmer
    @score += Evaluation::Programmer.new(@user).score
  end

  def disciplinarian
    @score += Evaluation::Disciplinarian.new(@user).score
  end

  def collaborator
    @score += Evaluation::Collaborator.new(@user).score
  end

  def influencer
    @score += Evaluation::Influencer.new(@user).score
  end
  
  def update_score
    @user.profile.update(score: @score.round(2))
  end

end
