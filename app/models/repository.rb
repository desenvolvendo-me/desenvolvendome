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
#  user_id          :bigint
#
# Indexes
#
#  index_repositories_on_user_id  (user_id)
#

class Repository < ApplicationRecord
  belongs_to :user, optional: true
  has_many :knowledges
end