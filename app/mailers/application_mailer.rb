class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  default from: 'app@desenvolvendo.me'
  layout 'mailer'
end
