require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @api_github = Api::Github.new
  end

  it "user" do
    login = "desenvolvendome"

    user = @api_github.user(login)

    expect(user['name']).to eq("Desenvolvendo Me")
  end


  it "reppositories" do
    login = "desenvolvendome"

    repositories = @api_github.repos(login)

    expect(repositories[0]['name']).to eq("php-blog")
    expect(repositories[1]['name']).to eq("ruby-blog")
  end

  it "reppository" do
    login = "desenvolvendome"
    repo = "ruby-blog"

    repository = @api_github.repo(login, repo)

    expect(repository['size']).to eq(142)
  end

end
