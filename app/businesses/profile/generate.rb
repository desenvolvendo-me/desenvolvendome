class Profile::Generate

  def initialize(user)
    @user = user
  end

  def kown
    Profile::Know.new.run @user
  end

  def score
    Profile::Score.new.run @user
  end

  def evaluation
    Evaluation::Influencer.new.run @user
  end
end
