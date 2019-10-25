class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.find_by_login(user_params["login"]) || User.new(user_params)

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

  def user_params
    params.require(:user).permit(:login, :email)
  end

end
