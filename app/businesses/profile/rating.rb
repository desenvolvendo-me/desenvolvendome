class Profile::Rating

  def initialize(user)
    @user = user
  end

  def run
    know
    score
  end

  private

  def know
    Profile::Rating::Know.new(@user).run
  end

  def score
    Profile::Rating::Score.new(@user).run
  end

end
