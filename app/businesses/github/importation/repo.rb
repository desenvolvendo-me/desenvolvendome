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
          repository = Repository.create(github_id: repo['id'],
                                         name: repo['name'],
                                         principal_technology: repo['language'],
                                         fork: repo['fork'],
                                         forks_count: repo['forks_count'],
                                         stargazers_count: repo['stargazers_count'],
                                         size: repo['size'], user: @user)
          languages(repo, repository)
        else
          repository.update(github_id: repo['id'],
                            name: repo['name'],
                            principal_technology: repo['language'],
                            fork: repo['fork'],
                            forks_count: repo['forks_count'],
                            stargazers_count: repo['stargazers_count'],
                            size: repo['size'], user: @user)
          languages(repo, repository)
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

  def repository(repo)
    @github.repo(@user.login, repo['name'])
  end

end