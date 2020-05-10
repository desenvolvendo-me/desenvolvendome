class LoadRepositoriesJob < ApplicationJob
  queue_as :load_repositories

  def perform(login)
    user = User.find_by_login(login)

    import_github(user)
    evaluations_count(user)
  end

  def import_github(user)
    Github::Importation.new.author(user)
    Github::Importation.new.reposities(user)
  end

  def evaluations_count(user)
    user.update(evaluations_count: user.evaluations_count.to_i + 1)
  end
end
