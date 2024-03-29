# == Schema Information
#
# Table name: evaluations
#
#  id              :bigint           not null, primary key
#  evaluation_type :integer
#  level           :integer
#  xp              :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile_id      :bigint           not null
#
# Indexes
#
#  index_evaluations_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#

class Evaluation < ApplicationRecord
  has_paper_trail only: [:xp, :level, :evaluation_type]
  belongs_to :profile

  enum evaluation_type: [:started, :novice, :knight]

  validates_presence_of :evaluation_type, :level

end
