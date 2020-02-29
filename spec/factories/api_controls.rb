# == Schema Information
#
# Table name: api_controls
#
#  id         :bigint           not null, primary key
#  consume    :integer
#  key        :string
#  limit      :integer
#  reset      :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :api_control do
    limit { 1 }
    consume { 1 }
    reset { "2020-02-29 10:34:20" }
  end
end
