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

class Conhecimento < ApplicationRecord
  default_scope { order(experiencia: :desc) }
  belongs_to :perfil, optional: true
  belongs_to :tecnologia, optional: true
end
