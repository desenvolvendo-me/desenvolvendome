class Github::Importation

  def initialize
    @github = Github::Api.new
  end

  def author(user)
    Github::Importation::Author.new.run(user)
  end

  def reposities(user)
    Github::Importation::Repo.new.run(user)
    Github::Importation::Lang.new.run(user)
  end

  def contributions(repository)
    Github::Importation::Commit.new.run(repository)
  end

end