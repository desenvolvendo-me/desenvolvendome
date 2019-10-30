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

  it "score with evaluation followers" do
    @user.update(followers: 150)

    Profile::Generate.new(@user).evaluation
    Profile::Generate.new(@user).score

    expect(@user.profile.score).to eq(1.6)
    evaluation = @user.profile.evaluations.first
    expect(evaluation.level).to eq(3)
    expect(evaluation.evaluation_type).to eq("influencer")
  end

end
