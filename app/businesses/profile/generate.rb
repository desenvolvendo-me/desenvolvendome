class Profile::Generate

  def initialize(user)
    @user = user
  end

  def run
    evaluation
    evolution
  end

  private

  def evaluation
    Profile::Rating.new(@user).run
  end

  def evolution
    Profile::Evolution.new(@user).run
  end


end
