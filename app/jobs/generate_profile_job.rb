class GenerateProfileJob < ApplicationJob
  queue_as :default

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
    Profile::Generate.new(user).evaluation
    Profile::Generate.new(user).score
  end

  def send_profile(user)
    ProfileMailer.with(user: user).evaluation_completed.deliver_now
  end

  def evaluations_count(user)
    user.update(evaluations_count: user.evaluations_count.to_i + 1)
  end
end
