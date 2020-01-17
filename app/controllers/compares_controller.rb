#TODO: Factoring esse controller
class ComparesController < ApplicationController

  def new
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:profile).page params[:page]
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
