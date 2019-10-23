# == Schema Information
#
# Table name: tecnologias
#
#  id          :bigint           not null, primary key
#  descricao   :string
#  experiencia :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :tecnologia do
    descricao { "Java" }
  end
end
