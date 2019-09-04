# == Schema Information
#
# Table name: reclamacoes
#
#  id         :bigint           not null, primary key
#  descricao  :text
#  titulo     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReclamacoesController < ApplicationController
  before_action :set_reclamacao, only: [:show, :edit, :update, :destroy]

  # GET /reclamacoes
  # GET /reclamacoes.json
  def index
    @reclamacoes = Reclamacao.all
  end

  # GET /reclamacoes/1
  # GET /reclamacoes/1.json
  def show
  end

  # GET /reclamacoes/new
  def new
    @reclamacao = Reclamacao.new
  end

  # GET /reclamacoes/1/edit
  def edit
  end

  # POST /reclamacoes
  # POST /reclamacoes.json
  def create
    @reclamacao = Reclamacao.new(reclamacao_params)

    respond_to do |format|
      if @reclamacao.save
        format.html { redirect_to @reclamacao, notice: 'Reclamacao was successfully created.' }
        format.json { render :show, status: :created, location: @reclamacao }
      else
        format.html { render :new }
        format.json { render json: @reclamacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reclamacoes/1
  # PATCH/PUT /reclamacoes/1.json
  def update
    respond_to do |format|
      if @reclamacao.update(reclamacao_params)
        format.html { redirect_to @reclamacao, notice: 'Reclamacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @reclamacao }
      else
        format.html { render :edit }
        format.json { render json: @reclamacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reclamacoes/1
  # DELETE /reclamacoes/1.json
  def destroy
    @reclamacao.destroy
    respond_to do |format|
      format.html { redirect_to reclamacoes_url, notice: 'Reclamacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reclamacao
      @reclamacao = Reclamacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reclamacao_params
      params.require(:reclamacao).permit(:titulo, :descricao)
    end
end
