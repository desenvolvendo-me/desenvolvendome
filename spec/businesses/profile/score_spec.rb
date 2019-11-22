require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  it "score" do
    Profile::Generate.new(@user).score

    expect(@user.profile.score).to eq(30)
  end

  it "level_up" do
    pending "pendente #{__FILE__}"
  end

end
