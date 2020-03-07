class Github::Importation::Commit < Github::Importation

  def run(user)
    @user = user
    import
  end

  private

  def import
    @user.repositories.each do |repository|
      get_contributions(repository)
      contributors = Contributor.joins(:contribution).where(login: @user.login)
      repository.update(commits_count: contributors.sum(:commits))
    end
  end

  def get_contributions(repository)
    @github.contributors(repository.user.login, repository.name).each do |contributor|
      contributor["weeks"].each do |week|
        contribution = Contribution.create(
            period: DateTime.strptime(week['w'].to_s, '%s'),
            commits: week['c'],
            additions: week['a'],
            deletions: week['d']
        )
        Contributor.create(login: contributor["author"]["login"], repository: repository, contribution: contribution)
      end
    end
  end

end