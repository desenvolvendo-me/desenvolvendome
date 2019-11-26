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
                 repositories_count: user['public_repos']
    )
  end

  def get_user
    @github.user(@user.login)
  end

end