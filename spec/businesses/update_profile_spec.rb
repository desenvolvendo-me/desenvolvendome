require 'rails_helper'

RSpec.describe "Generate" do

  before(:all) do
    @user = create(:user, :with_repository)
    UpdateProfile.new.run(@user)
  end

  it "profile" do
    knowledge = @user.profile.knowledges.first
    expect(@user.profile.score).to eq(0)
    expect(knowledge.experience).to eq(75.0)
    expect(knowledge.language.description).to eq("Portugol")
  end

  it "score" do
    GenerateScore.new.run(@user)

    expect(@user.profile.score).to eq(2)
  end

end
