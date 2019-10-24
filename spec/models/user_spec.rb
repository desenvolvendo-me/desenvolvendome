# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = create(:user, :with_repository)
  end

  it "create" do
    expect(@user.name).to eq("Marco Castro")
    expect(@user.login).to eq("marcodotcastro")
    expect(@user.followers).to eq(11)
    expect(@user.following).to eq(9)

    expect(@user.repositories.count).to eq(17)
    repository = @user.repositories.last
    expect(repository.name).to eq("study-rails-vs-phoenix-vs-laravel")

    # knowledge = repository.knowledges.first
    # expect(knowledge.experience).to eq(30)
    # expect(knowledge.language.description).to eq("Java")
  end

end
