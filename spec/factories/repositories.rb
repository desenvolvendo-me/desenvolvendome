# == Schema Information
#
# Table name: repositories
#
#  id               :bigint           not null, primary key
#  fork             :boolean
#  forks_count      :integer
#  name             :string
#  size             :integer
#  stargazers_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  github_id        :integer
#

FactoryBot.define do
  factory :repository do
    github_id { 1 }
    name { "MyString" }
    fork { false }
    size { 1 }
    forks_count { 1 }
    stargazers_count { 1 }
  end
end
