# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  email      :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  office     :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#
# Indexes
#
#  index_users_on_slug  (slug) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = create(:user, :with_repository, :with_profile)
  end

  it "create" do
    expect(@user.name).to eq("Marco")
    expect(@user.login).to eq("marcodotcastro")
    expect(@user.office).to eq("fullstack")
    expect(@user.followers).to eq(1)
    expect(@user.following).to eq(1)

    expect(@user.repositories.count).to eq(1)
    repository = @user.repositories.last
    expect(repository.name).to eq("hello_world")

    technology = repository.technologies.first
    expect(technology.exercise).to eq(5.5)
    expect(technology.language.description).to eq("Portugol")

    expect(@user.profile.score).to eq(5.5)
    evaluation = @user.profile.evaluations.first
    expect(evaluation.level).to eq(1)
    expect(evaluation.evaluation_type).to eq("influence_digital")

  end

end
