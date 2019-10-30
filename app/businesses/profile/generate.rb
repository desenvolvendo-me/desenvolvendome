class Profile::Generate

  def initialize(user)
    @user = user
  end

  def kown
    Profile::Know.new.run @user
  end

  def score
    Profile::Score.new.run @user
  end

  def evaluation
    Profile::Followers.new.run @user
  end
end
