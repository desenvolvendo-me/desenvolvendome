# == Schema Information
#
# Table name: perfis
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  descricao  :string
#  github     :string(255)
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
