class ProfilesController < ApplicationController

  def index
    @q = Profile.joins(:user).ransack(params[:q])
    @profiles = @q.result.not_hidden.order(created_at: :desc).page params[:page]
    @languages = Language.joins(knowledges: :profile).where("profiles.id in (?)", @profiles.pluck(:id)).order(description: :asc).distinct
  end

  def show
  end

  def hide
    current_user.profile.update(hide: !current_user.profile.hide)
    redirect_to user_path(current_user.login)
  end

end
