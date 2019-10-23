# == Schema Information
#
# Table name: repositories
#
#  id               :bigint           not null, primary key
#  fork             :boolean
#  forks_count      :integer
#  name             :string
#  size             :integer
#  stargazers_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  github_id        :integer
#

class Repository < ApplicationRecord
  belongs_to :user, optional: true
  has_many :knowledges
  has_many :languages, through: :knowledges
end
