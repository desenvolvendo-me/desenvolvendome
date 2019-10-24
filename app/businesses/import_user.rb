class ImportUser
  def initialize(user)
    @github = Github.new
    @user = user
    basic_info
    repositories
  end

  def basic_info
    user = @github.user(@user.login)
    @user.name = user['name']
    @user.avatar = user['avatar_url']
    @user.bio = user['bio']
    @user.followers = user['followers']
    @user.following = user['following']
  end

  def repositories
    @github.repos(@user.login).each do |repo|
      repository = @github.repo(@user.login, repo['name'])
      commits = nil
      @github.commits(@user.login, repo['name']).each do |contribuidor|
        if contribuidor['login'] == @user.login
          commits = contribuidor
        end
      end
      @user.repositories << Repository.create(github_id: repository['id'],
                                              name: repository['name'],
                                              fork: repository['fork'],
                                              forks_count: repository['forks_count'],
                                              stargazers_count: repository['stargazers_count'],
                                              commits_count: commits ? commits['contributions'] : 0,
                                              size: repository['size'])
    end
  end

end