# == Schema Information
#
# Table name: contributions
#
#  id             :bigint           not null, primary key
#  additions      :integer
#  calculated     :boolean
#  commits        :integer
#  deletions      :integer
#  period         :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  contributor_id :bigint           not null
#
# Indexes
#
#  index_contributions_on_contributor_id  (contributor_id)
#
# Foreign Keys
#
#  fk_rails_...  (contributor_id => contributors.id)
#

class Contribution < ApplicationRecord
  belongs_to :contributor

  after_create :set_repository_size_type

  private

  def set_repository_size_type
    contributor.set_repository_size_type
  end

end
