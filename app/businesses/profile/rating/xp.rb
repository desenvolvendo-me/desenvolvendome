class Profile::Rating::Xp

  def initialize(user)
    @user = user
    @xp = 0
  end

  def run
    update_xp
  end

  private

  def update_xp
    @user.profile.evaluation.update(xp: @user.repositories.sum(:commits_count))
  end

end
