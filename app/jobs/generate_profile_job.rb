require_relative '../../app/businesses/import/github'
require_relative '../../app/businesses/profile/generate'

class GenerateProfileJob < ApplicationJob
  queue_as :default

  def perform(user)
    import_github(user)
    profile_generate(user)
    send_profile(user)
  end

  def import_github(user)
    Import::Github.new.run user
  end

  def profile_generate(user)
    Profile::Generate.new(user).kown
    Profile::Generate.new(user).evaluation
    Profile::Generate.new(user).score
  end

  def send_profile(user)
    ProfileMailer.with(user: user).evaluation_completed.deliver_now
  end
end
