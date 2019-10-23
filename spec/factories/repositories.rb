# == Schema Information
#
# Table name: repositories
#
#  id               :bigint           not null, primary key
#  fork             :boolean
#  forks_count      :integer
#  name             :string
#  size             :integer
#  stargazers_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  github_id        :integer
#  user_id          :bigint
#
# Indexes
#
#  index_repositories_on_user_id  (user_id)
#

FactoryBot.define do
  factory :repository do
    github_id {1}
    name {"study-rails-vs-phoenix-vs-laravel"}
    fork {false}
    size {330}
    forks_count {1}
    stargazers_count {9}

    trait :with_knowledges do
      after(:create) do |repository|
        create(:knowledge, repository: repository, experience: 30, language: create(:language, description: "Java"))
        create(:knowledge, repository: repository, experience: 50, language: create(:language, description: "Ruby"))
        create(:knowledge, repository: repository, experience: 20, language: create(:language, description: "Shell"))
      end
    end
  end
end
