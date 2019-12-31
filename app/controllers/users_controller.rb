class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all.page params[:page]
  end

  def new
  end

  def show
  end

  private

  def set_user
    @user = User.includes(profile: [knowledges: :language]).where(login: params[:id]).take
  end

end
