# == Schema Information
#
# Table name: compares
#
#  id                 :bigint           not null, primary key
#  comparations_count :integer
#  login              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  compared_id        :integer
#

FactoryBot.define do
  factory :compare do
    comparations_count { "MyString" }
    user { nil }
    compared { nil }
  end
end
