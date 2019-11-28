class ProfilesController < ApplicationController

  def index
  end

  def show
  end

  def starteds
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:started]).order(score: :desc).page params[:page]
  end

  def novices
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:novice]).order(score: :desc).page params[:page]
  end

  def knights
    @profiles = Profile.joins(:evaluation).where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:knight]).order(score: :desc).page params[:page]
  end

end
