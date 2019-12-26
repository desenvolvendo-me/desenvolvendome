# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  contact_type :integer
#  description  :text
#  email        :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Contact < ApplicationRecord

  enum contact_type: [:hi, :critical, :suggestion, :improvement]

  validates_presence_of :name, :email, :description, :contact_type

end
