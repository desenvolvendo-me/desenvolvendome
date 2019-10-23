# == Schema Information
#
# Table name: languages
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Language < ApplicationRecord
  has_many :knowledges
end
