class Profile::LevelUp

  def initialize(user)
    @user = user
  end

  def run
    started = Evaluation::Started.new(@user)
    started.run

    novice = Evaluation::Novice.new(@user)
    novice.run if started.up?

    knight = Evaluation::Knight.new(@user)
    knight.run if novice.up?
  end

end
