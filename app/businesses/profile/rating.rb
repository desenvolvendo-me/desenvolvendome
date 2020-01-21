class Profile::Rating

  def initialize(user)
    @user = user
  end

  def run
    know
    xp
  end

  private

  def know
    Profile::Rating::Know.new(@user).run
  end

  def xp
    Profile::Rating::Xp.new(@user).run
  end

end
