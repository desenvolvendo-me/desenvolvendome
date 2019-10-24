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
    score { 1.5 }
  end
end