# == Schema Information
#
# Table name: perfis
#
#  id            :bigint           not null, primary key
#  descricao     :string
#  nome          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tecnologia_id :bigint           not null
#
# Indexes
#
#  index_perfis_on_tecnologia_id  (tecnologia_id)
#
# Foreign Keys
#
#  fk_rails_...  (tecnologia_id => tecnologias.id)
#

class Perfil < ApplicationRecord
  has_many :conhecimentos
end
