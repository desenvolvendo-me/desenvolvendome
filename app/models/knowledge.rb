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
  paginates_per 12
  belongs_to :profile, optional: true
  belongs_to :language, optional: true

  scope :ordered_by_level, -> {order(level: :desc)}
  scope :ordered_by_language, -> { includes(:language).order('languages.description DESC')}

  enum knowledge_type: [:basic, :normal, :rare, :special, :unknown]
end
