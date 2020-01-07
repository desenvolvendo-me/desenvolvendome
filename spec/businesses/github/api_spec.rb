require 'rails_helper'

RSpec.describe "Github::Api" do

  before(:all) do
    @api_github = Github::Api.new
  end

  it "user" do
    login = "desenvolvendome"

    user = @api_github.user(login)

    expect(user['name']).to eq("Desenvolvendo Me")
  end


  it "repositories" do
    login = "desenvolvendome"

    repositories = @api_github.repos(login, 0)

    expect(repositories[0]['name']).to eq("php-blog")
    expect(repositories[1]['name']).to eq("ruby-blog")
  end

  it "repository" do
    login = "desenvolvendome"
    repo = "ruby-blog"

    repository = @api_github.repo(login, repo)

    expect(repository['size']).to eq(149)
  end

  context "commits" do
    it "desenvolvendome/ruby-blog" do
      login = "desenvolvendome"
      repo = "ruby-blog"

      commits = @api_github.commits(login, repo)

      expect(commits.first['contributions']).to be > 0
    end

    it "leonardoscorza/KombiCode" do
      login = "leonardoscorza"
      repo = "KombiCode"

      commits = @api_github.commits(login, repo)

      expect(commits).to be_an_instance_of(Array)
    end

    it "lucascaton/udemy-dl" do
      login = "lucascaton"
      repo = "udemy-dl"

      commits = @api_github.commits(login, repo)

      expect(commits).to be_an_instance_of(Array)
    end
  end

end
