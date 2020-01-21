class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
  end

  def show
  end

  def rule
  end

  def historic
    @user = current_user
  end

  def reimport
    GenerateProfileJob.perform_later(current_user.login)
    redirect_to user_path(current_user.login)
  end

  private

  def set_user
    @user = User.includes(profile: [knowledges: :language]).where(login: params[:id]).take
  end

end
