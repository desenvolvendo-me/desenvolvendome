class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
  end

  def show
  end

  def rule
  end

  def reimport
    user = User.find_by_login(params["login"])
    GenerateProfileJob.perform_later(user.login)
    redirect_to user_path(user.login)
  end

  private

  def set_user
    @user = User.includes(profile: [knowledges: :language]).where(login: params[:id]).take
  end

end
