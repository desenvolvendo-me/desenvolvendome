require 'rails_helper'

RSpec.describe "Github::Importation::User" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
  end

  it "user" do
    Github::Importation::User.new.run(@user)

    expect(@user.name).to eq("Desenvolvendo Me")
    expect(@user.login).to eq("desenvolvendome")
    expect(@user.followers).to eq(1)
    expect(@user.following).to eq(1)
  end

end
