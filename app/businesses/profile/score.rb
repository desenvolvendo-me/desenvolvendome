class Profile::Score

  def initialize(user)
    @user = user
    @score = 0
  end

  def run
    update_score
  end

  private

  def update_score
    @user.profile.update(score: @user.repositories.sum(:commits_count))
  end

end
