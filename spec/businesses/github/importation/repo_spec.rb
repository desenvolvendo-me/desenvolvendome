require 'rails_helper'

RSpec.describe "Github::Importation::Repo" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
    Github::Importation::User.new.run(@user)
  end

  context "run" do

    it "ruby-blog create" do
      Github::Importation::Repo.new.run(@user)

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
      Github::Importation::Repo.new.run(@user)

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

  end

end
