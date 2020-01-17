#TODO: Factoring esse controller
class ComparesController < ApplicationController

  def new
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:profile).page params[:page]
  end

  def show
    @user = User.find_by_login(params[:user])
    @compared = User.find_by_login(params[:compared])

    Compare.create(user: @user, compared: @compared)
  end

  private

  def compare_params
    params.require(:compare).permit(:user, :compared)
  end

end
