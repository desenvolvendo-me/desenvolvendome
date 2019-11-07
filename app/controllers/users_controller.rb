class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def new
  end

  def show
  end

  def confirmation
  end

  private

  def set_user
    @user = User.includes(profile: [knowledges: :language]).friendly.find(params[:id])
  end

end
