class SentryJob < ActiveJob::Base
  queue_as :sentry

  def perform(event)
    Raven.send_event(event)
  end
end

