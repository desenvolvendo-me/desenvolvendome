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
    works = contributions.sum(:additions) + contributions.sum(:deletions)

    #TODO: Analisar e definir quantidade de trabalho define um size_type
    case works
    when (0..5000)
      repository.update(size_type: :small)
    when (5001..10000)
      repository.update(size_type: :medium)
    when (10001..50000)
      repository.update(size_type: :big)
    else
      repository.update(size_type: :professional)
    end

  end

end
