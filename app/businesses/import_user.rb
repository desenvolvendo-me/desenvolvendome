class ImportUser
  def initialize(user)
    @github = Github.new
    @user = user
    basic_info
  end

  def basic_info
    user = @github.getUser(@user.login)
    @user.name = user['name']
    @user.avatar = user['avatar_url']
    @user.bio = user['bio']
    @user.followers = user['followers']
    @user.following = user['following']
  end
end