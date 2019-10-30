# == Schema Information
#
# Table name: evaluations
#
#  id              :bigint           not null, primary key
#  evaluation_type :integer
#  level           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile_id      :bigint           not null
#
# Indexes
#
#  index_evaluations_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#

FactoryBot.define do
  factory :evaluation do
    level {1}
    evaluation_type {:influencer}
  end
end
