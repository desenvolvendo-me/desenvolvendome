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

FactoryBot.define do
  factory :perfil do
    nome {"Marco Castro"}
    descricao {"Programador com 15 anos de experiência"}
    github {"marcodotcastro"}
    avatar {"https://avatars2.githubusercontent.com/u/15907252?s=460&v=4"}
  end
end
