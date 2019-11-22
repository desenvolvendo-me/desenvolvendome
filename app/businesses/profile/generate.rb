class Profile::Generate

  def initialize(user)
    @user = user
  end

  def run
    score
    level_up
  end

  def score
    Profile::Score.new(@user).run
  end

  def level_up
    Profile::LevelUp.new(@user).run
  end

end
