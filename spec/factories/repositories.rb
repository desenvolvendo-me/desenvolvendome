# == Schema Information
#
# Table name: repositories
#
#  id                   :bigint           not null, primary key
#  commits_count        :integer
#  fork                 :boolean
#  forks_count          :integer
#  name                 :string
#  principal_technology :string
#  size                 :integer
#  stargazers_count     :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  github_id            :integer
#  user_id              :bigint
#
# Indexes
#
#  index_repositories_on_user_id  (user_id)
#

FactoryBot.define do
  factory :repository do
    github_id {1}
    name {"hello_world"}
    fork {false}
    size {330}
    forks_count {1}
    stargazers_count {9}

    trait :with_technologies do
      after(:create) do |repository|
        portugol = create(:language, description: "Portugol")
        create(:technology, repository: repository, exercise: 5500, language: portugol)
        create(:technology, repository: repository, exercise: 2000, language: portugol)
        create(:technology, repository: repository, exercise: 1000, language: create(:language, description: "Abap"))
        create(:technology, repository: repository, exercise: 1500, language: create(:language, description: "COBOL"))
      end
    end

  end
end
