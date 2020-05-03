# == Schema Information
#
# Table name: compares
#
#  id                 :bigint           not null, primary key
#  comparations_count :integer
#  login              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  compared_id        :integer
#

#TODO: Remover comparations_count
class Compare < ApplicationRecord
  belongs_to :user
  belongs_to :compared, class_name: "User"
end
