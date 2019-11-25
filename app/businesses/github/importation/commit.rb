class Github::Importation::Commit < Github::Importation

  def run(user)
    @user = user
    commits
  end

  def commits
    commits_per_contribuidor = nil
    @user.repositories.each do |repository|
      github_commits = @github.commits(@user.login, repository.name)
      return nil unless github_commits

      github_commits.each do |contribuidor|
        if contribuidor['login'] == @user.login
          commits_per_contribuidor = contribuidor
        end
      end

      repository.update(commits_count: commits_per_contribuidor ? commits_per_contribuidor['contributions'] : 0,)
    end
  end


end