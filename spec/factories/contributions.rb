# == Schema Information
#
# Table name: contributions
#
#  id         :bigint           not null, primary key
#  additions  :integer
#  commits    :integer
#  deletions  :integer
#  period     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :contribution do
    period { "2020-03-07 15:38:20" }
    additions { 1 }
    deletions { 1 }
    commits { 1 }
  end
end
