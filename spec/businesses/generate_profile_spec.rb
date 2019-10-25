require 'rails_helper'

RSpec.describe "GenerateProfile" do

  before(:all) do
    @user = create(:user, :with_repository)
  end

  it "user" do
    GenerateProfile.new(@user)

    knowledge = @user.profile.knowledges.first
    expect(@user.profile.score).to eq(0)
    expect(knowledge.experience).to eq(50.0)
    expect(knowledge.language.description).to eq("Portugol")
  end

end
