Raven.configure do |config|
  config.dsn = 'https://0587d7ad75f14098a3c08c89c8cb8b77:4d9041fb45c041e4bff24590498d587d@sentry.io/1813391'
  config.environments = %w(development staging production)
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.async = lambda {|event| SentryJob.perform_later(event)}
end
