class Github::Importation::Commit < Github::Importation

  def run(user)
    @user = user
    import
  end

  private

  def import
    @user.repositories.each do |repository|
      repository.update(commits_count: get_contributions(repository))
    end
  end

  def get_contributions(repository)
    get_commits(repository).each do |contribuidor|
      if contribuidor['login'] == @user.login
        return contribuidor ? contribuidor['contributions'] : 0
      end
    end
  end

  def get_commits(repository)
    @github.commits(@user.login, repository.name)
  end

end