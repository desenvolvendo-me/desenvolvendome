# == Schema Information
#
# Table name: interests
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ApplicationRecord
end