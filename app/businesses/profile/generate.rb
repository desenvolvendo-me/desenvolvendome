class Profile::Generate

  def initialize(user)
    @user = user
  end

  def score
    Profile::Score.new(@user).run
  end

  def evaluation
    Evaluation::Know.new(@user).run
    Evaluation::Started.new(@user).run
  end
end
