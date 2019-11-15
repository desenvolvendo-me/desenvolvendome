class SentryJob < ActiveJob::Base
  queue_as :sentry

  def perform(event)
    Raven.send_event(event) if event["request"]['url'].include? "0.0.0.0"
  end
end

