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
  belongs_to :user, optional: true
  has_many :knowledges, dependent: :destroy
  has_one :evaluation, dependent: :destroy

  scope :evaluation, -> (args) {
    joins(:evaluation)
        .where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[args[:evaluation_type]])
        .limit(args[:limit])
        .order(score: :desc)
  }
end
