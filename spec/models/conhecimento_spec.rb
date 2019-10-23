require 'rails_helper'

RSpec.describe Conhecimento, type: :model do

  before(:all) do
    @conhecimento = create(:conhecimento, :com_perfil_e_tecnologia)
  end

  it "criar" do
    expect(@conhecimento.perfil.nome).to eq("Marco Castro")
    expect(@conhecimento.tecnologia.descricao).to eq("Java")
    expect(@conhecimento.experiencia).to eq(0.7)
  end

end
