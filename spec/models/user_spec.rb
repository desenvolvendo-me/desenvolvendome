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
    expect(@user.repositories.first.name).to eq("study-rails-vs-phoenix-vs-laravel")
    expect(@user.repositories.first.knowledges.first.experience).to eq(30)
    expect(@user.repositories.first.knowledges.first.language.description).to eq("Java")
  end

end
