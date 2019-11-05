class Import::Github

  def initialize
    @github = Api::Github.new
  end

  def run(user)
    @user = user
    ActiveRecord::Base.transaction do
      basic_info
      repositories
    end
  end

  def basic_info
    user = @github.user(@user.login)
    @user.update(name: user['name'],
                 avatar: user['avatar_url'],
                 bio: user['bio'],
                 followers: user['followers'],
                 following: user['following'],
                 repositories_count: user['public_repos']
    )
  end

  def repositories
    repositories_count = @user.repositories_count
    pages = (repositories_count / 100) + 1
    pages.times do |page|
      @github.repos(@user.login, page).each.with_index do |repo, index|
        Rails.logger.info "User: #{@user.login}, Repository: #{repo['name']} #{page * 100}#{index} to #{repositories_count}"
        repo = repository(repo)
        commits = commits(repo)
        repository = Repository.find_by(github_id: repo['id']) #includes
        unless repository
          repository = Repository.create(github_id: repo['id'],
                                         name: repo['name'],
                                         principal_technology: repo['language'],
                                         fork: repo['fork'],
                                         forks_count: repo['forks_count'],
                                         stargazers_count: repo['stargazers_count'],
                                         commits_count: commits ? commits['contributions'] : 0,
                                         size: repo['size'], user: @user)
          languages(repo, repository)
        else
          repository.update(github_id: repo['id'],
                            name: repo['name'],
                            principal_technology: repo['language'],
                            fork: repo['fork'],
                            forks_count: repo['forks_count'],
                            stargazers_count: repo['stargazers_count'],
                            commits_count: commits ? commits['contributions'] : 0,
                            size: repo['size'])
          languages(repo, repository)
        end
      end
    end
  end

  private

  def languages(repo, repository)
    @github.languages(@user.login, repo['name']).each do |language|
      lang = Language.find_or_create_by(description: language[0])

      technology = repository.technologies.find_by(language: lang)
      unless technology
        Technology.create(exercise: language[1], language: lang, repository: repository)
      else
        technology.update(exercise: language[1])
      end
    end
  end

  def commits(repo)
    github_commits = @github.commits(@user.login, repo['name'])
    return nil unless github_commits
    commits = nil
    github_commits.each do |contribuidor|
      if contribuidor['login'] == @user.login
        commits = contribuidor
      end
    end
    commits
  end

  def repository(repo)
    @github.repo(@user.login, repo['name'])
  end

end