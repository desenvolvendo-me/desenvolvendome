# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  avatar             :string
#  bio                :string
#  email              :string
#  evaluations_count  :integer
#  followers          :integer
#  following          :integer
#  login              :string
#  name               :string
#  office             :integer
#  repositories_count :integer
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  github_id          :integer
#
# Indexes
#
#  index_users_on_slug  (slug) UNIQUE
#

FactoryBot.define do
  factory :user do
    github_id {15907252}
    login {"marcodotcastro"}
    office {:fullstack}
    email {"marco.castro@desenvolvendo.me"}
    name {"Marco"}
    bio {"Pai da Luísa, Empreendedor e Engenheiro de Software. Fã do ecossistema do Ruby e Rails, mas trabalho também com PHP, Java e Javascript."}
    avatar {"https://avatars2.githubusercontent.com/u/15907252?s=460&v=4"}
    followers {0}
    following {0}

    trait :with_repositories do
      transient do
        commits_count {100}
        principal_technology {"Z"}
      end
      after(:create) do |user, evaluator|
        create(:repository, :with_technologies, principal_technology: evaluator.principal_technology, commits_count: evaluator.commits_count, user: user)
        create(:repository, :with_technologies, principal_technology: evaluator.principal_technology, user: user)
      end
    end

    trait :with_profile do
      after(:create) do |user|
        create(:profile, :with_knowledges, :with_evalutions, user: user)
      end
    end

  end
end
