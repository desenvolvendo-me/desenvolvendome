class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception
  before_action :set_raven_context

  private

  def set_raven_context
    Raven.user_context(id: 1) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def handle_exception(exception)
    #NOTE: para não usar o sentry em development local, somente na digitalocean já que hoje estamos usando em modo development
    Raven.capture_exception(exception) if request.original_url.include? "0.0.0.0"
    raise exception
  end
end
