class RankingsController < ApplicationController

  def index
    @profiles = Profile.not_hidden
  end

  def starteds
    @profiles = Profile.joins(:evaluation).not_hidden.where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:started]).order("evaluations.xp": :desc).page params[:page]
  end

  def novices
    @profiles = Profile.joins(:evaluation).not_hidden.where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:novice]).order("evaluations.xp": :desc).page params[:page]
  end

  def knights
    @profiles = Profile.joins(:evaluation).not_hidden.where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[:knight]).order("evaluations.xp": :desc).page params[:page]
  end

end
