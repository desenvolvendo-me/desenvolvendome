require 'rails_helper'

RSpec.describe "Know" do

  before(:all) do
    @user = create(:user, :with_repository)
    Profile::Know.new(@user).run
  end

  it "knowledge" do
    knowledge = @user.profile.knowledges.first
    expect(@user.profile.score).to eq(0)
    expect(knowledge.experience).to eq(75.0)
    expect(knowledge.language.description).to eq("Portugol")
  end


end
