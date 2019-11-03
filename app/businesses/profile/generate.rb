class Profile::Generate

  def initialize(user)
    @user = user
  end

  def kown
    Profile::Know.new(@user).run
  end

  def score
    Profile::Score.new(@user).run
  end

  def evaluation
    #Exact
    Evaluation::Programmer.new(@user).run
    Evaluation::Disciplinarian.new(@user).run

    #Human
    Evaluation::Influencer.new(@user).run
    Evaluation::Collaborator.new(@user).run
  end
end
