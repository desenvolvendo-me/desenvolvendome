# == Schema Information
#
# Table name: compares
#
#  id                 :bigint           not null, primary key
#  comparations_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  compared_id         :integer
#  user_id            :integer
#

class Compare < ApplicationRecord
  belongs_to :user
  belongs_to :compared, class_name: "User"
end
