# == Schema Information
#
# Table name: tecnologias
#
#  id          :bigint           not null, primary key
#  descricao   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tecnologia < ApplicationRecord
  has_many :conhecimentos
end
