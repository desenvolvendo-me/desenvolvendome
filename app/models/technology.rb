class Technology < ApplicationRecord
  belongs_to :repository, optional: true
  belongs_to :language, optional: true
end
