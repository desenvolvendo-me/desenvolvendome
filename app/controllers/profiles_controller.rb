class ProfilesController < ApplicationController

  def new
    @q = User.order(created_at: :desc).ransack(params[:q])
    @users = @q.result(distinct: true).includes(:profile).page params[:page]
  end

  def index
  end

  def show
  end

end
