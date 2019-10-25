require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @user = create(:user, login: "desenvolvendome")
  end

  it "user" do
    Import::Github.new.run(@user)

    expect(@user.name).to eq("Desenvolvendo Me")
    expect(@user.login).to eq("desenvolvendome")
    expect(@user.followers).to eq(1)
    expect(@user.following).to eq(1)

    expect(@user.repositories.count).to eq(1)
    repository = @user.repositories.last
    expect(repository.name).to eq("projeto-ruby")
    expect(repository.principal_technology).to eq("Ruby")

    technology = repository.technologies.first
    expect(technology.exercise).to eq(32120)
    expect(technology.language.description).to eq("Ruby")

    technology = repository.technologies.last
    expect(technology.exercise).to eq(709)
    expect(technology.language.description).to eq("CSS")
  end

end
