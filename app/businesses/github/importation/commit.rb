class Github::Importation::Commit < Github::Importation
  MAX_CONTRIBUTOR_PER_REPOSITORY = 5

  def run(repository)
    @repository = repository
    import
  end

  private

  def import
    get_contributions(@repository)
    contributors = Contributor.joins(:contributions).where(login: @repository.user.login)
    @repository.update(commits_count: contributors.sum(:commits))
  end

  def get_contributions(repository)
    contributores_github = @github.contributors(repository.user.login, repository.name)
    if contributores_github.count < MAX_CONTRIBUTOR_PER_REPOSITORY
      contributores_github.each do |contributor_github|
        contributor_github["weeks"].each do |week|
          create_contribution(contributor_github, repository, week)
        end
      end
    end
  end

  def create_contribution(contributor_github, repository, week)
    period = DateTime.strptime(week['w'].to_s, '%s')
    contributor = Contributor.find_or_create_by(login: contributor_github["author"]["login"], repository_id: repository.id)
    unless contributor.contributions.where(period: period).any?
      work_in_week = week['c'] + week['a'] + week['d']
      unless work_in_week.eql?(0)
        Contribution.create(period: period, commits: week['c'], additions: week['a'], deletions: week['d'], contributor: contributor)
      end
    end
  end

end