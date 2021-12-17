require 'rails_helper'

RSpec.describe "Github::Importation::Author" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
  end

  xit "user" do
    Github::Importation::Author.new.run(@user)

    expect(@user.name).to eq("Desenvolvendo Me")
    expect(@user.login).to eq("desenvolvendome")
    expect(@user.followers).to eq(1)
    expect(@user.following).to eq(1)
  end

end
