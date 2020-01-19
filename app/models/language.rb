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

  KNOWLEDGE_TYPE = {
      basic: ["HTML", "CSS", "JavaScript", "Shell", "PowerShell"],
      normal: ["Java", "Python", "Ruby", "PHP", "C#", "TypeScript"],
      rare: ["C", "C++", "Groovy", "Dockerfile", "Vue"],
      special: ["Swift", "Objective-C ", "Kotlin", "Go", "Elixir", "Erlang"]
  }

  enum knowledge_type: [:basic, :normal, :rare, :special, :unknown]
  enum rarity: [:very_low, :low, :medium, :high, :very_high]

  has_many :knowledges
  has_many :technologies


  before_save :set_knowledge_type

  private

  def set_knowledge_type
    knowledge_type = :unknown
    knowledge_type = :basic if KNOWLEDGE_TYPE[:basic].include? self.description
    knowledge_type = :normal if KNOWLEDGE_TYPE[:normal].include? self.description
    knowledge_type = :rare if KNOWLEDGE_TYPE[:rare].include? self.description
    knowledge_type = :special if KNOWLEDGE_TYPE[:special].include? self.description
    self.knowledge_type = knowledge_type
  end
end
