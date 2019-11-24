class Profile::Generate

  def initialize(user)
    @user = user
  end

  def run
    evaluation
    evolution
    score
  end

  private

  def evaluation
    Profile::Evaluation.new(@user).run
  end

  def evolution
    Profile::Evolution.new(@user).run
  end

  def score
    Profile::Score.new(@user).run
  end

end
