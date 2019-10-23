# == Schema Information
#
# Table name: conhecimentos
#
#  id            :bigint           not null, primary key
#  experiencia   :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  perfil_id     :bigint           not null
#  tecnologia_id :bigint           not null
#
# Indexes
#
#  index_conhecimentos_on_perfil_id      (perfil_id)
#  index_conhecimentos_on_tecnologia_id  (tecnologia_id)
#
# Foreign Keys
#
#  fk_rails_...  (perfil_id => perfis.id)
#  fk_rails_...  (tecnologia_id => tecnologias.id)
#

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
