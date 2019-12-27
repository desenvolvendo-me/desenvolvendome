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

require 'rails_helper'

RSpec.describe Compare, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
