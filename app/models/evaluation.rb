# == Schema Information
#
# Table name: evaluations
#
#  id              :bigint           not null, primary key
#  evaluation_type :integer
#  level           :integer
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
  default_scope {order(level: :desc)}
  belongs_to :profile

  enum evaluation_type: [:not_evaluation, :influencer, :programmer, :collaborator, :disciplinarian]

  validates_presence_of :evaluation_type, :level

end
