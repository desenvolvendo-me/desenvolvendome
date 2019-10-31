require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:all) do
    @user = create(:user, :with_repository)
    Profile::Generate.new(@user).kown
  end

  it "score" do
    Profile::Generate.new(@user).score

    expect(@user.profile.score).to eq(1.2)
  end

end
