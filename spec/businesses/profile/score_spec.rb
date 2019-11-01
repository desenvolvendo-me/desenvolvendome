require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:each) do
    @user = create(:user, :with_repositories)
    Profile::Generate.new(@user).kown
  end

  it "score" do
    Profile::Generate.new(@user).score

    expect(@user.profile.score).to eq(2)
  end

end
