# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  hide       :boolean
#  processing :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryBot.define do
  factory :profile do
    score {5.5}
    processing {40}

    trait :with_knowledges do
      after(:create) do |profile|
        create(:knowledge, level: 15, profile: profile, experience: 25, language: create(:language, description: "Portugol"))
        create(:knowledge, level: 10, profile: profile, experience: 50, language: create(:language, description: "Abap"))
        create(:knowledge, level: 100, profile: profile, experience: 25, language: create(:language, description: "CSS"))
      end
    end

    trait :with_evalutions do
      after(:create) do |profile|
        create(:evaluation, profile: profile)
      end
    end

  end
end
