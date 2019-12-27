class ComparesController < ApplicationController

  def new
    @compare = Compare.new
  end

  def create
    user1 = User.find_by_login(compare_params[:login_1])
    user2 = User.find_by_login(compare_params[:login_2])

    @compare = Compare.new(user: user1, compared: user2)

    respond_to do |format|
      if @compare.save!
        format.html {redirect_to compare_path(login_1: @compare.user.login, login_2: @compare.compared.login )}
      else
        format.html {render :new}
      end
    end
  end

  def show
    @user = User.find_by_login(params[:login_1])
    @compared = User.find_by_login(params[:login_2])
  end

  private

  def compare_params
    params.require(:compare).permit(:login_1, :login_2)
  end


end
