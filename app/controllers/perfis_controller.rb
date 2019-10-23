class PerfisController < ApplicationController

  def new
    @perfil = Perfil.new
  end

  def show
    @perfil = Perfil.find(params[:id])
  end

  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html {redirect_to @perfil}
      else
        format.html {render :new}
      end
    end
  end

  private

  def perfil_params
    params.require(:perfil).permit(:github)
  end
end
