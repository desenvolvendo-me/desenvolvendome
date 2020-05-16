class EvaluationRepositoriesJob < ApplicationJob
  queue_as :evaluation_repositories

  def perform(login)
    user = User.find_by_login(login)

    user.repositories.each do |repository|
      import_github(repository)
    end

    profile_generate(user)
    #NOTE: Não será enviado email ainda
    # send_profile(user)
    evaluations_count(user)
  end

  def import_github(repository)
    Github::Importation.new.contributions(repository)
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
