require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:all) do
    @user = create(:user, :with_repository)
    Profile::Know.new.run(@user)
  end

  it "score" do
    Profile::Score.new.run(@user)

    expect(@user.profile.score).to eq(2)
  end

end
