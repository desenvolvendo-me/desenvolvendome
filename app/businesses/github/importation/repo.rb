# NOTA:
# O nome da classe está curta Repo, pois gerar conflito com a model Repository, caso use o mesmo nome dado pelo github
# FIXME: Corrigir os conflitos entre nomes das classes
class Github::Importation::Repo < Github::Importation

  def run(user)
    @user = user
    import
  end

  private

  def import
    get_repos(@user.repositories_count)
  end

  def get_repos(repositories_count)
    @github.repos(@user.login, repositories_count).each.with_index do |repo, index|
      set_repository(repo)
    end
  end

  def set_repository(repo)
    repository = Repository.find_by(github_id: repo['id'])
    if repository
      repository.update(github_id: repo['id'],
                        name: repo['name'],
                        principal_technology: repo['language'],
                        fork: repo['fork'],
                        forks_count: repo['forks_count'],
                        stargazers_count: repo['stargazers_count'],
                        pushed_at: repo['pushed_at'].to_date,
                        size: repo['size'], user: @user)

    else
      Repository.create(github_id: repo['id'],
                        name: repo['name'],
                        principal_technology: repo['language'],
                        fork: repo['fork'],
                        forks_count: repo['forks_count'],
                        stargazers_count: repo['stargazers_count'],
                        pushed_at: repo['pushed_at'].to_date,
                        size: repo['size'], user: @user)
    end
  end

end