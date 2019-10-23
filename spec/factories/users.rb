# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#

FactoryBot.define do
  factory :user do
    name {"Marco Castro"}
    bio {"Pai da Luísa, Empreendedor e Engenheiro de Software. Fã do ecossistema do Ruby e Rails, mas trabalho também com PHP, Java e Javascript."}
    avatar {"https://avatars2.githubusercontent.com/u/15907252?s=460&v=4"}
    login {"marcodotcastro"}
    github_id {15907252}
    followers {16}
    following {7}

    #
    # trait :with_repository do
    #   after(:create) do |user|
    #     create(:conhecimento, user: user, experiencia: 30, tecnologia: create(:tecnologia, descricao: "Java"))
    #     create(:conhecimento, user: user, experiencia: 50, tecnologia: create(:tecnologia, descricao: "Ruby"))
    #     create(:conhecimento, user: user, experiencia: 20, tecnologia: create(:tecnologia, descricao: "Shell"))
    #   end
    # end

  end
end
