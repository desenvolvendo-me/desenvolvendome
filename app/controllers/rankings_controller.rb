class RankingsController < ApplicationController

  def index
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
