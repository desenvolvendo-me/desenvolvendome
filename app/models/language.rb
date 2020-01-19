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
  paginates_per 24
  has_many :knowledges
  has_many :technologies
end
