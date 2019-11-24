class Profile::LevelUp

  def initialize(user)
    @user = user
  end

  def run
    started = Evolution::Started.new(@user)
    started.run

    novice = Evolution::Novice.new(@user)
    novice.run if started.up?

    knight = Evolution::Knight.new(@user)
    knight.run if novice.up?
  end

end
