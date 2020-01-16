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

FactoryBot.define do
  factory :contact do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    contact_type {[:doubt, :critical, :suggestion, :improvement].sample}
    description {Faker::Lorem.question(word_count: [5, 10, 20, 30].sample)}
    response {Faker::Lorem.question(word_count: [3, 5, 10].sample) if [true, false].sample}
  end
end
