class Profile::Generate

  def initialize(user)
    @user = user
  end

  def kown
    Profile::Know.new(@user).run
  end

  def score
    Profile::Score.new(@user).run
  end

  def evaluation
    Evaluation::Programmer.new(@user).run
    Evaluation::Influencer.new(@user).run
  end
end
