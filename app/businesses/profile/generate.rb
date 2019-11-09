class Profile::Generate

  def initialize(user)
    @user = user
  end

  def score
    Profile::Score.new(@user).run
  end

  def evaluation
    Evaluation::Know.new(@user).run

    #Exact
    Evaluation::Programmer.new(@user).run
    Evaluation::Disciplinarian.new(@user).run

    #Human
    Evaluation::Influencer.new(@user).run
    Evaluation::Collaborator.new(@user).run
  end
end
