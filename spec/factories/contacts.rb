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

FactoryBot.define do
  factory :contact do
    name { "MyString" }
    email { "MyString" }
    contact_type { 1 }
    description { "MyString" }
  end
end
