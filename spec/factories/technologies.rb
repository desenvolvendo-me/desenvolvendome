# == Schema Information
#
# Table name: technologies
#
#  id            :bigint           not null, primary key
#  exercise      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  language_id   :bigint
#  repository_id :bigint
#
# Indexes
#
#  index_technologies_on_language_id    (language_id)
#  index_technologies_on_repository_id  (repository_id)
#

FactoryBot.define do
  factory :technology do
    exercise {1000}
  end
end
