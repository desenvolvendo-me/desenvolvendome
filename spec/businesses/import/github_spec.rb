require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @user = create(:user, login: "desenvolvendome")
    Import::Github.new.run(@user)
  end

  context "repositories" do

    it "user" do
      expect(@user.name).to eq("Desenvolvendo Me")
      expect(@user.login).to eq("desenvolvendome")
      expect(@user.followers).to eq(1)
      expect(@user.following).to eq(1)

      expect(@user.repositories.count).to eq(2)
    end

    it "ruby-blog" do
      repository = @user.repositories.last
      expect(repository.name).to eq("ruby-blog")
      expect(repository.principal_technology).to eq("Ruby")

      technology = repository.technologies.first
      expect(technology.exercise).to eq(32120)
      expect(technology.language.description).to eq("Ruby")

      technology = repository.technologies.last
      expect(technology.exercise).to eq(709)
      expect(technology.language.description).to eq("CSS")
    end

    it "php-blog" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

  end


end
