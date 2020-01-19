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

class Language < ApplicationRecord
  paginates_per 24

  enum knowledge_type: [:basic, :normal, :rare, :special, :unknown]
  enum rarity: [:very_low, :low, :medium, :high, :very_high]

  has_many :knowledges
  has_many :technologies
end
