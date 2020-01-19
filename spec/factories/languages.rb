# == Schema Information
#
# Table name: languages
#
#  id             :bigint           not null, primary key
#  description    :string
#  knowledge_type :integer
#  rarity         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :language do
    description {"Portugol"}
  end
end
