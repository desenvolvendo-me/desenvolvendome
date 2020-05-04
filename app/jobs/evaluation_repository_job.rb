class EvaluationRepositoryJob < ApplicationJob
  queue_as :evaluation_repository

  def perform(repository)
    repository = Repository.find(repository)
    user = User.find_by_login(repository.user.login)

    import_github(repository)
    profile_generate(user)
    #NOTE: Não será enviado email ainda
    # send_profile(user)
    evaluations_count(user)
  end

  def import_github(user)
    Github::Importation.new.contributions user
  end

  def profile_generate(user)
    Profile::Generate.new(user).run
  end

  def send_profile(user)
    ProfileMailer.with(user: user).evaluation_completed.deliver_now
  end

  def evaluations_count(user)
    user.update(evaluations_count: user.evaluations_count.to_i + 1)
  end
end
