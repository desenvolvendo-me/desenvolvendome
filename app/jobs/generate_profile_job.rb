class GenerateProfileJob < ApplicationJob
  queue_as :profile

  def perform(login)
    user = User.find_by_login(login)

    import_github(user)
    profile_generate(user)
    #NOTE: Não será enviado email ainda
    # send_profile(user)
    evaluations_count(user)
  end

  def import_github(user)
    Github::Importation.new.author user
    Github::Importation.new.reposities(user)

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
