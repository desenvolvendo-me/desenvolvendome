class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  def index
    @q = Profile.joins(:user).ransack(params[:q])
    @profiles = @q.result.not_hidden.order(created_at: :desc).page params[:page]
    @languages = Language.joins(knowledges: :profile).where("profiles.id in (?)", @profiles.pluck(:id)).order(description: :asc).distinct
  end

  def show
  end

  def hide
    current_user.profile.update(hide: !current_user.profile.hide)
    redirect_to profile_show_path(current_user.login)
  end

  def rule
  end

  def reimport
    GenerateProfileJob.perform_later(current_user.login)
    redirect_to profile_show_path(current_user.login)
  end

  def historic
    @user = current_user
  end

  def historic_admin
    @user = User.find_by_login(params[:login])
  end

  private

  def set_profile
    @profile = Profile.joins(:user).where("users.login = ?", params[:id]).take
  end

end
