# == Schema Information
#
# Table name: perfis
#
#  id         :bigint           not null, primary key
#  descricao  :string
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Perfil, type: :model do

  before(:all) do
    @perfil = create(:perfil)
  end

  it "criar" do
    expect(@perfil.nome).to eq("Marco Castro")
    expect(@perfil.descricao).to eq("Programador com 15 anos de experiência")
  end

end
