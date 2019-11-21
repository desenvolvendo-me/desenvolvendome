require 'rails_helper'

RSpec.describe "Know" do

  before(:all) do
    @user = create(:user, :with_repositories, :with_profile)
    Evaluation::Know.new(@user).run
  end

  it "knowledge" do
    knowledge = @user.profile.knowledges.first
    expect(knowledge.experience).to eq(50.0)
    expect(knowledge.language.description).to eq("Abap")
  end


end
