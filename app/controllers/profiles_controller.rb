class ProfilesController < ApplicationController

  def index
    @q = Profile.joins(:user).ransack(params[:q])
    @profiles = @q.result(distinct: true).not_hidden.order(created_at: :desc).page params[:page]
  end

  def show
  end

end
