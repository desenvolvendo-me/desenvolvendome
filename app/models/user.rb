# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#

class User < ApplicationRecord
  belongs_to :profile, optional: true
  has_many :repositories

  before_create :update_user
  before_update :update_user

  private

  def update_user
    ImportUser.new(self)
  end
end
