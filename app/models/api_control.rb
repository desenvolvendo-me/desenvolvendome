# == Schema Information
#
# Table name: api_controls
#
#  id          :bigint           not null, primary key
#  consume     :integer
#  description :text
#  key         :string
#  limit       :integer
#  reset       :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ApiControl < ApplicationRecord
end
