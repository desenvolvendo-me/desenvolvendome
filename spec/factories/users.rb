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
    github_id {15907252}
    login {"marcodotcastro"}
    name {"Marco Castro"}
    bio {"Pai da Luísa, Empreendedor e Engenheiro de Software. Fã do ecossistema do Ruby e Rails, mas trabalho também com PHP, Java e Javascript."}
    avatar {"https://avatars2.githubusercontent.com/u/15907252?s=460&v=4"}
    followers {16}
    following {7}

    trait :with_repository do
      after(:create) do |user|
        create(:repository, :with_knowledges, user: user)
      end
    end

  end
end
