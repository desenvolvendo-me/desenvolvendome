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
  default_scope {order(experience: :desc)}

  belongs_to :profile, optional: true
  belongs_to :language, optional: true

  enum knowledge_type: [:basic, :normal, :rare, :special]

end
