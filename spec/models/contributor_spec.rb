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

require 'rails_helper'

RSpec.describe Contributor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
