require 'rails_helper'

RSpec.describe "Github" do

  before(:all) do
    @user = create(:user, login: "desenvolvendome")

    technology = create(:technology, language: create(:language, description: "PHP"))
    create(:repository, name: 'php-blog', github_id: "218968548", stargazers_count: 1, user: @user, technologies: [technology])

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

    it "ruby-blog create" do
      repository = @user.repositories.last
      expect(repository.name).to eq("ruby-blog")
      expect(repository.principal_technology).to eq("Ruby")

      expect(repository.technologies.count).to eq(4)

      technology = repository.technologies.first
      expect(technology.exercise).to eq(32120)
      expect(technology.language.description).to eq("Ruby")

      technology = repository.technologies.last
      expect(technology.exercise).to eq(709)
      expect(technology.language.description).to eq("CSS")
    end

    it "php-blog create" do
      repository = @user.repositories.first
      expect(repository.name).to eq("php-blog")
      expect(repository.principal_technology).to eq("PHP")

      expect(repository.technologies.count).to eq(4)

      technology = repository.technologies.first
      expect(technology.exercise).to eq(86149)
      expect(technology.language.description).to eq("PHP")

      technology = repository.technologies.last
      expect(technology.exercise).to eq(3)
      expect(technology.language.description).to eq("CSS")
    end

    it "ruby-blog update" do
      repository = @user.repositories.find_by(github_id: "218968548")
      expect(repository.name).to eq("php-blog")
      expect(repository.stargazers_count).to eq(0)

      repository.update(pushed_at: "2019-11-01T11:16:01Z".to_date)
      expect(repository.pushed_at).to eq("2019-11-01T11:16:01Z".to_date)
    end

  end


end
