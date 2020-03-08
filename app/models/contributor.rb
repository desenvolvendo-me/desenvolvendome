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

  def set_repository_size_type
    small = {min_work: 0, max_work: 5000}
    medium = {min_work: 5001, max_work: 10000}
    big = {min_work: 10001, max_work: 50000}

    works = contributions.sum(:additions) + contributions.sum(:deletions)

    case works
    when (small[:min_work]..small[:max_work])
      repository.update(size_type: :small)
    when (medium[:min_work]..medium[:max_work])
      repository.update(size_type: :medium)
    when (big[:min_work]..big[:max_work])
      repository.update(size_type: :big)
    else
      repository.update(size_type: :professional)
    end

  end

end
