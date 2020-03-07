# == Schema Information
#
# Table name: repositories
#
#  id                   :bigint           not null, primary key
#  commits_count        :integer
#  fork                 :boolean
#  forks_count          :integer
#  name                 :string
#  principal_technology :string
#  pushed_at            :date
#  size                 :integer
#  stargazers_count     :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  github_id            :integer
#  user_id              :bigint
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#


class Repository < ApplicationRecord
  paginates_per 12
  belongs_to :user, optional: true
  has_many :technologies, dependent: :destroy
  has_many :contributors

  after_save :update_processing

  scope :with_contribution, -> {
    where.not(commits_count: 0)
  }

  scope :no_contribution, -> {
    where(commits_count: 0)
  }

  def contributions_count
    8
  end

  private

  def update_processing
    user.profile.update(processing: user.profile.processing - 1) if user.profile
  end

end
