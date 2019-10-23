class PerfisController < ApplicationController
  def new
    @perfil = Perfil.new
  end

  def show
  end

  private

  def contato_params
    params.require(:perfil).permit(:github)
  end
end
