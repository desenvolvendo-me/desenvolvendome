class Profile::Evaluation

  def initialize(user)
    @user = user
  end

  def run
    Evaluation::Know.new(@user).run
  end

end
