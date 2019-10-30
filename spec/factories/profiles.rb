# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
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

    trait :with_knowledges do
      after(:create) do |profile|
        create(:knowledge, profile: profile, experience: 30, language: create(:language, description: "Portugol"))
        create(:knowledge, profile: profile, experience: 50, language: create(:language, description: "Abap"))
        create(:knowledge, profile: profile, experience: 20, language: create(:language, description: "COBOL"))
      end
    end

    trait :with_evalutions do
      after(:create) do |profile|
        create(:evaluation, profile: profile)
      end
    end

  end
end
