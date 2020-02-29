class Github::Importation::User < Github::Importation

  def run(user)
    @user = user
    import
  end

  private

  def import
    user = get_user
    @user.update(name: user['name'],
                 avatar: user['avatar_url'],
                 bio: user['bio'],
                 followers: user['followers'],
                 following: user['following'],
                 repositories_count: limit_repositories_count
    )
  end

  def get_user
    @github.user(@user.login)
  end

  def limit_repositories_count
    50
  end

end