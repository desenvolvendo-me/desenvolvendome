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
        @user.save
      else
        @user.update(user_params)
      end

      if @user.valid?

        GenerateProfileJob.perform_later @user

        format.html {redirect_to confirmation_user_path}
      else
        format.html {render :new}
      end

    end
  end

  def confirmation

  end

  private

  def set_user
    @user = User.includes(profile: [knowledges: :language]).friendly.find(params[:id])
  end

  def find_user
    @user = User.includes(profile: [knowledges: :language]).find_by_login(user_params["login"]) || User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:login, :email, :office)
  end

end
