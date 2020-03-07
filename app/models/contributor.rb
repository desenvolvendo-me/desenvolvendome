# == Schema Information
#
# Table name: contributors
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contribution_id :bigint           not null
#  repository_id   :bigint           not null
#  login         :bigint           not null
#
# Indexes
#
#  index_contributors_on_contribution_id  (contribution_id)
#  index_contributors_on_repository_id    (repository_id)
#
# Foreign Keys
#
#  fk_rails_...  (contribution_id => contributions.id)
#  fk_rails_...  (repository_id => repositories.id)
#

class Contributor < ApplicationRecord
  belongs_to :repository
  belongs_to :contribution
end
