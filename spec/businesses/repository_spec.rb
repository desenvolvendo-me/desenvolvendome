require 'rails_helper'

RSpec.describe "Repository" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  it "small" do
    @repository = create(:repository, :small, user: @user)

    expect(@repository.technologies.count).to eq(4)
    expect(@repository.technologies.first.language.description).to eq("Ruby")
    expect(@repository.technologies.last.language.description).to eq("Javascript")

    expect(@repository.contributors.last.contributions.count).to eq(6)
    expect(@repository.contributors.last.contributions.first.additions).to eq(395)
  end

end