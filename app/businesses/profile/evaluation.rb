class Profile::Evaluation

  def initialize(user)
    @user = user
  end

  def run
    know
    score
  end

  private

  def know
    Profile::Evaluation::Know.new(@user).run
  end

  def score
    Profile::Evaluation::Score.new(@user).run
  end

end
