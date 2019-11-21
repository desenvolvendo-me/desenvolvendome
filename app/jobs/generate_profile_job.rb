class GenerateProfileJob < ApplicationJob
  queue_as :profile

  def perform(user)
    import_github(user)
    profile_generate(user)
    #NOTE: Não será enviado email ainda
    # send_profile(user)
    evaluations_count(user)
  end

  def import_github(user)
    Import::Github.new.run user
  end

  def profile_generate(user)
    Profile::Generate.new(user).know
    Profile::Generate.new(user).score
    Profile::Generate.new(user).level_up
  end

  def send_profile(user)
    ProfileMailer.with(user: user).evaluation_completed.deliver_now
  end

  def evaluations_count(user)
    user.update(evaluations_count: user.evaluations_count.to_i + 1)
  end
end
