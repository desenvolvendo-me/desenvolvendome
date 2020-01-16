# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  contact_type :integer
#  description  :text
#  email        :string
#  name         :string
#  response     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Contact < ApplicationRecord
  include Gravtastic
  gravtastic

  paginates_per 5

  enum contact_type: [:doubt, :critical, :suggestion, :improvement]

  validates_presence_of :name, :email, :description, :contact_type

  def to_s
    "#{self.created_at.strftime("%d/%m/%y %H:%M")}: #{self.name}"
  end

end
