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
#  pushed_at            :date
#  size                 :integer
#  size_type            :integer
#  stargazers_count     :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  github_id            :integer
#  user_id              :bigint
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#

FactoryBot.define do
  factory :repository do
    github_id {1}
    name {"hello_world"}
    commits_count {15}
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

    trait :small do
      after(:create) do |repository|
        technologies = [{exercise: 1000, language: "Ruby"}, {exercise: 1000, language: "HTML"}, {exercise: 1000, language: "CSS"}, {exercise: 1000, language: "Javascript"}]

        technologies.each do |technology|
          language = create(:language, description: technology[:language])
          create(:technology, repository: repository, exercise: technology[:exercise], language: language)
        end

        create(:contributor, :with_contributions, repository: repository, login: repository.user.login)
      end
    end

    trait :medium do
    end

    trait :big do
    end

    trait :professional do
    end

  end
end
