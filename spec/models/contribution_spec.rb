# == Schema Information
#
# Table name: contributions
#
#  id         :bigint           not null, primary key
#  additions  :integer
#  commits    :integer
#  deletions  :integer
#  period     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Contribution, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
