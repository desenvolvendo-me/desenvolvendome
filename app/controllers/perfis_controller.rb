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
    @perfil = Perfil.find_by_github(perfil_params["github"]) || Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.new_record?
        if @perfil.save
          format.html {redirect_to @perfil}
        else
          format.html {render :new}
        end
      else
        if @perfil.update(perfil_params)
          format.html {redirect_to perfil_path(@perfil)}
        else
          format.html {render :new}
        end
      end
    end
  end

  private

  def perfil_params
    params.require(:perfil).permit(:github)
  end

end
