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

      @user.repositories << Repository.create(github_id: repository['id'], name: repository['name'], size: repository['size'])
    end
  end

end