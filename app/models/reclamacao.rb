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

class Reclamacao < ApplicationRecord
end
