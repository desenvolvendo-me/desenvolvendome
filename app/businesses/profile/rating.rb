class Profile::Rating

  def initialize(user)
    @user = user
  end

  def run
    know
  end

  private

  def know
    Profile::Rating::Know.new(@user).run
  end

end
