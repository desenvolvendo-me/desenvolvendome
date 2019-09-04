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

require 'rails_helper'

RSpec.describe Reclamacao, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
