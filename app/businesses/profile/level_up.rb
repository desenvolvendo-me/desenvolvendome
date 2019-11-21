class Profile::LevelUp

  def initialize(user)
    @user = user
  end

  def run
    Evaluation::Started.new(@user).run
    Evaluation::Novice.new(@user).run
    Evaluation::Knight.new(@user).run
  end

end
