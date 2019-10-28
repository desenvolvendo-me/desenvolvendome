# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  email      :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#
# Indexes
#
#  index_users_on_slug  (slug) UNIQUE
#

class User < ApplicationRecord
  extend FriendlyId
  has_one :profile, dependent: :destroy
  has_many :repositories, dependent: :destroy

  friendly_id :slug_name, use: :slugged

  def slug_name
    "#{SecureRandom.hex[0..10]}"
  end
end
