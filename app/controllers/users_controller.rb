class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :find_user, only: [:create]

  def new
    @user = User.new
  end

  def show
  end

  def create

    respond_to do |format|
      if @user.new_record?
        if @user.save
          format.html {redirect_to @user}
        else
          format.html {render :new}
        end
      else
        if @user.update(user_params)
          format.html {redirect_to user_path(@user)}
        else
          format.html {render :new}
        end
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def find_user
    @user = User.find_by_login(user_params["login"]) || User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:login, :email)
  end

end
