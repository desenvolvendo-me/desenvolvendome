class RepositoriesController < ApplicationController

  def user
    @q = current_user.repositories.ransack(params[:q])
    @repositories = @q.result(distinct: true).page params[:page]
  end

end
