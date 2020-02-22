class Profile::Generate

  def initialize(user)
    @user = user
    user.profile.evaluation = Evaluation.new(evaluation_type: :started, level: 0, xp: 0) unless user.profile.evaluation
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
