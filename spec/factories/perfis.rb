# == Schema Information
#
# Table name: perfis
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  descricao  :string
#  github     :string(255)
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :perfil do
    nome {"Marco Castro"}
    descricao {"Programador com 15 anos de experiência"}
    avatar {"https://avatars2.githubusercontent.com/u/15907252?s=460&v=4"}
    github {"marcodotcastro"}

    trait :com_conhecimentos do
      after(:create) do |perfil|
        create(:conhecimento, perfil: perfil, experiencia: 0.5, tecnologia: create(:tecnologia, descricao: "Ruby"))
        create(:conhecimento, perfil: perfil, experiencia: 0.3, tecnologia: create(:tecnologia, descricao: "Java"))
        create(:conhecimento, perfil: perfil, experiencia: 0.2, tecnologia: create(:tecnologia, descricao: "Shell"))
      end
    end

  end
end
