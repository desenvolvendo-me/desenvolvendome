require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @api_github = Github.new
  end

  it "getUser" do
    login = "marcodotcastro"

    user = @api_github.getUser(login)

    expect(user['name']).to eq("Marco Castro")
  end


end
