require 'rails_helper'

RSpec.describe "GenerateScore" do

  before(:all) do
    @user = create(:user, :with_repository)
    Profile::Know.new.run(@user)
  end

  it "score" do
    Profile::Score.new.run(@user)

    expect(@user.profile.score).to eq(2.2)
    evaluation = @user.profile.evaluations.first
    expect(evaluation.level).to eq(1)
    expect(evaluation.evaluation_type).to eq("influence_digital")
  end

  it "score with followers" do
    @user.update(followers: 150)

    Profile::Score.new.run(@user)

    expect(@user.profile.score).to eq(2.6)
    evaluation = @user.profile.evaluations.first
    expect(evaluation.level).to eq(3)
    expect(evaluation.evaluation_type).to eq("influence_digital")
  end

end
