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
  validates :email, :email_format => { :message => 'não é válido' }

  validates_uniqueness_of :email

  def to_s
    "#{self.created_at.strftime("%d/%m/%y %H:%M")}: #{self.email}"
  end
end
