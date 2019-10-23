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

require 'rails_helper'

RSpec.describe Perfil, type: :model do

  before(:all) do
    @perfil = create(:perfil, :com_conhecimentos)
  end

  it "criar" do
    expect(@perfil.nome).to eq("Marco Castro")
    expect(@perfil.descricao).to eq("Programador com 15 anos de experiência")
  end

  it "com conhecimentos" do
    expect(@perfil.conhecimentos.order("experiencia desc").first.tecnologia.descricao).to eq("Ruby")
    expect(@perfil.conhecimentos.order("experiencia desc").last.tecnologia.descricao).to eq("Shell")
  end

end
