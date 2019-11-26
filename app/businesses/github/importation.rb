class Github::Importation

  def initialize
    @github = Github::Api.new
  end

  def run(user)
    Github::Importation::User.new.run(user)
    Github::Importation::Repo.new.run(user)
    Github::Importation::Commit.new.run(user)
    Github::Importation::Lang.new.run(user)
  end

end