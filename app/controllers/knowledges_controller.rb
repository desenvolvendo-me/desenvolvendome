class KnowledgesController < ApplicationController

  def index
    @q = Language.joins(:knowledges).ransack(params[:q])
    @languages = @q.result.group(:id).order('COUNT(knowledges.id) DESC').page params[:page]
  end

  def user
    @q = current_user.profile.knowledges.ransack(params[:q])
    @knowledges = @q.result(distinct: true).page params[:page]
  end

end
