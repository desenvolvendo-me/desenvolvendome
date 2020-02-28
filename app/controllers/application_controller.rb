class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception
  before_action :set_raven_context

  private

  def set_raven_context
    Raven.user_context(login: current_user)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def handle_exception(exception)
    Raven.capture_exception(exception)
    raise exception
  end
end
