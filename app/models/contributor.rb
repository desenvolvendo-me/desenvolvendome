# == Schema Information
#
# Table name: contributors
#
#  id            :bigint           not null, primary key
#  login         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  repository_id :bigint           not null
#
# Indexes
#
#  index_contributors_on_repository_id  (repository_id)
#
# Foreign Keys
#
#  fk_rails_...  (repository_id => repositories.id)
#

class Contributor < ApplicationRecord
  belongs_to :repository
  has_many :contributions
end
