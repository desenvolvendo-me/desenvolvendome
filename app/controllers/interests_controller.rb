class InterestsController < ApplicationController

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)

    respond_to do |format|
      if @interest.save
        format.html {redirect_to interest_path}
      else
        format.html {render :new}
      end
    end
  end

  def show

  end

  private

  def interest_params
    params.require(:interest).permit(:email)
  end

end
