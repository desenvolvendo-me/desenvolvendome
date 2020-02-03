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

  def xp
    number = 0
    bytes = self[:xp].to_i
    kilobytes = (bytes / 1024)
    megabytes = (kilobytes / 1024)
    gigabytes = (megabytes / 1024)

    number = bytes.to_f.round(2).to_s + "b" if bytes > 1
    number = kilobytes.to_f.round(2).to_s + "kb" if kilobytes > 1
    number = megabytes.to_f.round(2).to_s + "mb" if megabytes > 1
    number = gigabytes.to_f.round(2).to_s + "gb" if gigabytes > 1
    number
  end

end
