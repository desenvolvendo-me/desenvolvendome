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
    pages, repositories_count = calc_pages
    pages.times do |page|
      get_repos(page, repositories_count)
    end
  end

  def get_repos(page, repositories_count)
    @github.repos(@user.login, page).each.with_index do |repo, index|
      Rails.logger.info "User: #{@user.login}, Repository: #{repo['name']}, #{index + 1} to #{repositories_count}"
      set_repository(repo)
    end
  end

  def set_repository(repo)
    repo = get_repo(repo)
    repository = Repository.find_by(github_id: repo['id'])
    if repository
      repository.update(github_id: repo['id'],
                        name: repo['name'],
                        principal_technology: repo['language'],
                        fork: repo['fork'],
                        forks_count: repo['forks_count'],
                        stargazers_count: repo['stargazers_count'],
                        size: repo['size'], user: @user)

    else
      Repository.create(github_id: repo['id'],
                        name: repo['name'],
                        principal_technology: repo['language'],
                        fork: repo['fork'],
                        forks_count: repo['forks_count'],
                        stargazers_count: repo['stargazers_count'],
                        size: repo['size'], user: @user)
    end
  end

  def calc_pages
    repositories_count = @user.repositories_count
    pages = (repositories_count / 100) + 1
    return pages, repositories_count
  end

  def get_repo(repo)
    @github.repo(@user.login, repo['name'])
  end

end