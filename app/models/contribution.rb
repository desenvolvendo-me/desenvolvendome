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

class Contribution < ApplicationRecord
end
