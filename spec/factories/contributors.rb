# == Schema Information
#
# Table name: contributors
#
#  id            :bigint           not null, primary key
#  login         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  repository_id :bigint           not null
#
# Indexes
#
#  index_contributors_on_repository_id  (repository_id)
#
# Foreign Keys
#
#  fk_rails_...  (repository_id => repositories.id)
#

FactoryBot.define do
  factory :contributor do

    trait :with_contributions do
      after(:create) do |contributor|
        contributions = [
            {commits: 4, additions: 395, deletions: 380, period: DateTime.strptime("1580601600", '%s')},
            {commits: 11, additions: 209, deletions: 170, period: DateTime.strptime("1581206400", '%s')},
            {commits: 0, additions: 0, deletions: 0, period: DateTime.strptime("1581811200", '%s')},
            {commits: 0, additions: 0, deletions: 0, period: DateTime.strptime("1582416000", '%s')},
            {commits: 0, additions: 0, deletions: 0, period: DateTime.strptime("1583020800", '%s')},
            {commits: 0, additions: 0, deletions: 0, period: DateTime.strptime("1583625600", '%s')},
        ]

        contributions.each do |contribution|
          create(:contribution,
                 commits: contribution[:commits],
                 additions: contribution[:additions],
                 deletions: contribution[:deletions],
                 period: contribution[:period],
                 contributor: contributor
          )
        end
      end
    end

  end
end
