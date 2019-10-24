require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @api_github = Github.new
  end

  it "user" do
    login = "marcodotcastro"

    user = @api_github.user(login)

    expect(user['name']).to eq("Marco Castro")
  end


  it "reppositories" do
    login = "marcodotcastro"

    repositories = @api_github.repos(login)

    expect(repositories[0]['name']).to eq("application-lifecycle-management")
  end

  it "reppository" do
    login = "marcodotcastro"
    repo = "study-rails-vs-phoenix-vs-laravel"

    repository = @api_github.repo(login, repo)

    expect(repository['size']).to eq(330)
  end

end
