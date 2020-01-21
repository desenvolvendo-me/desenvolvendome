# == Schema Information
#
# Table name: knowledges
#
#  id             :bigint           not null, primary key
#  experience     :float
#  knowledge_type :integer
#  level          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  language_id    :bigint
#  profile_id     :bigint
#
# Indexes
#
#  index_knowledges_on_language_id  (language_id)
#  index_knowledges_on_profile_id   (profile_id)
#

class Knowledge < ApplicationRecord
  audited only: [:knowledge_type, :level]
  paginates_per 12

  belongs_to :profile, optional: true
  belongs_to :language, optional: true

  scope :ordered_by_level, -> {order(level: :desc)}
  scope :ordered_by_language, -> {includes(:language).order('languages.description DESC')}

  enum knowledge_type: [:basic, :normal, :rare, :special, :unknown]

  after_save :calc_language_rarity

  private

  def calc_language_rarity
    return nil unless self.language.present?
    total_profile = Profile.count
    language_all_knowledge = Language.joins(:knowledges).where(id: self.language.id).group(:description).order('COUNT(knowledges.id) DESC').count[self.language.description]

    percente = (language_all_knowledge.to_f / total_profile.to_f) * 100

    case (percente.round(1))
    when 90.0..100.0
      rarity = :very_low
    when 70.0..89.9
      rarity = :low
    when 30.0..69.9
      rarity = :medium
    when 10.0..29.9
      rarity = :high
    when 0.0..9.9
      rarity = :very_high
    end

    self.language.update!(rarity: rarity)
  end
end
