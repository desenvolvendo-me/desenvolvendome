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

class Perfil < ApplicationRecord
  has_many :conhecimentos
end
