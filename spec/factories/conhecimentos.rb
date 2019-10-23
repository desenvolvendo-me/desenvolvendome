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

FactoryBot.define do
  factory :conhecimento do
    experiencia {0.7}

    trait :com_perfil_e_tecnologia do
      before(:create) do |conhecimento|
        conhecimento.update(perfil: create(:perfil), tecnologia: create(:tecnologia))
      end
    end

  end
end
