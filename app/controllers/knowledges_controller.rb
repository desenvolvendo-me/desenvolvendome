class KnowledgesController < ApplicationController

  def index
    @q = current_user.profile.knowledges.ransack(params[:q])
    @knowledges = @q.result(distinct: true).page params[:page]
  end

end
