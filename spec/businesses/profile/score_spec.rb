require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  it "score" do
    Profile::Score.new(@user).run

    expect(@user.profile.score).to eq(30)
  end

  xit "evolution" do
  end

end
