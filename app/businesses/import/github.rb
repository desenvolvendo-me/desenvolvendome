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
                 following: user['following'])
  end

  def repositories
    @github.repos(@user.login).each do |repo|
      repo = repository(repo)
      commits = commits(repo)
      repository = Repository.find_by(github_id: repo['id'])
      unless repository
        repository = Repository.create(github_id: repo['id'],
                                       name: repo['name'],
                                       principal_technology: repo['language'],
                                       fork: repo['fork'],
                                       forks_count: repo['forks_count'],
                                       stargazers_count: repo['stargazers_count'],
                                       commits_count: commits ? commits['contributions'] : 0,
                                       size: repo['size'])
        languages(repo, repository)
        @user.repositories << repository
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

  private

  def languages(repo, repository)
    @github.languages(@user.login, repo['name']).each do |language|
      lang = Language.find_or_create_by(description: language[0])
      repository.technologies << Technology.create(exercise: language[1], language: lang)
    end
  end

  def commits(repo)
    commits = nil
    @github.commits(@user.login, repo['name']).each do |contribuidor|
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