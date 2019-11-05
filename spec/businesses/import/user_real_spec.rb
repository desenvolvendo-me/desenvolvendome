require 'rails_helper'

RSpec.describe "UserReal" do

  it 'rafaelfranca' do
    @user = create(:user, login: "rafaelfranca")

    Import::Github.new.run(@user)

    expect(@user.repositories.find_by_name("simple_form-bootstrap").name).to eq("simple_form-bootstrap")
    expect(@user.repositories.count).to eq(155)
  end

end
