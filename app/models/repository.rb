
class Repository < ApplicationRecord
  belongs_to :user, optional: true
  has_many :technologies
end
