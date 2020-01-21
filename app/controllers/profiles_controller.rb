class ProfilesController < ApplicationController

  def new
    @q = User.order(created_at: :desc).ransack(params[:q])
    @users = @q.result(distinct: true).includes(:profile).page params[:page]
  end

  def index
  end

  def show
  end

  def starteds
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:started]).order("evaluations.xp": :desc).page params[:page]
  end

  def novices
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:novice]).order("evaluations.xp": :desc).page params[:page]
  end

  def knights
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:knight]).order("evaluations.xp": :desc).page params[:page]
  end

end
