# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  processing :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
#TODO: Mudar score para xp
class Profile < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  paginates_per 25
  belongs_to :user, optional: true
  has_many :knowledges, dependent: :destroy
  has_one :evaluation, dependent: :destroy

  scope :evaluation, -> (args) {
    joins(:evaluation)
        .where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[args[:evaluation_type]])
        .limit(args[:limit])
        .order(score: :desc)
  }


  def score
    number = 0
    bytes = self[:score].to_i
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
