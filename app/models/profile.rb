# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  hide       :boolean
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
        .order("evaluations.xp": :desc)
  }

  scope :not_hidden, -> {
    where(hide: [false, nil])
  }

  scope :hidden, -> {
    where(hide: true)
  }

end
