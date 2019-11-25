# NOTA:
# O nome da classe está curta Repo, pois gerar conflito com a model Repository, caso use o mesmo nome dado pelo github
# FIXME: Corrigir os conflitos entre nomes das classes
class Github::Importation::Repo < Github::Importation

  def run(user)
    @user = user
    repositories
  end

  def repositories
    repositories_count = @user.repositories_count
    pages = (repositories_count / 100) + 1
    pages.times do |page|
      @github.repos(@user.login, page).each.with_index do |repo, index|
        logging(index, repo, repositories_count)
        repo = repository(repo)
        repository = Repository.find_by(github_id: repo['id'])
        unless repository
          Repository.create(github_id: repo['id'],
                            name: repo['name'],
                            principal_technology: repo['language'],
                            fork: repo['fork'],
                            forks_count: repo['forks_count'],
                            stargazers_count: repo['stargazers_count'],
                            size: repo['size'], user: @user)
        else
          repository.update(github_id: repo['id'],
                            name: repo['name'],
                            principal_technology: repo['language'],
                            fork: repo['fork'],
                            forks_count: repo['forks_count'],
                            stargazers_count: repo['stargazers_count'],
                            size: repo['size'], user: @user)
        end
      end
    end
  end

  private

  def logging(index, repo, repositories_count)
    log = "User: #{@user.login}, "
    log += "Repository: #{repo['name']}, "
    log += "#{index + 1} to #{repositories_count}"

    Rails.logger.info log
  end

  def repository(repo)
    @github.repo(@user.login, repo['name'])
  end

end