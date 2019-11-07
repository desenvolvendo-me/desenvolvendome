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

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :knowledges, dependent: :destroy
  has_many :evaluations, dependent: :destroy
end
