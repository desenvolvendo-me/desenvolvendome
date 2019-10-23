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

  before_validation :update_user

  private

  def update_user
    #FIXME: Github api deve atualizar: user, repository, language e knowledge
    # github = Github.new
    # user = github.getUser(self.login)
    # self.name = user['name']
    # self.avatar = user['avatar_url']
    # self.bio = user['bio']
  end
end
