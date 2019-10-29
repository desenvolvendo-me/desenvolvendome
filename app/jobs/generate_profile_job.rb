require_relative '../../app/businesses/import/github'
require_relative '../../app/businesses/profile/know'
require_relative '../../app/businesses/profile/score'

class GenerateProfileJob < ApplicationJob
  queue_as :default

  def perform(user)
    Import::Github.new.run user
    Profile::Know.new.run user
    Profile::Score.new.run user
    ProfileMailer.with(user: user).evaluation_completed.deliver_now
  end
end
