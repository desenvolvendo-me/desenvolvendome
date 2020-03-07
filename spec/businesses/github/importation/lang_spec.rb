require 'rails_helper'

RSpec.describe "Github::Importation::Lang" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
    Github::Importation::Author.new.run(@user)
    Github::Importation::Repo.new.run(@user)
  end

  context "run" do

    it "langs ruby-blog" do
      Github::Importation::Lang.new.run(@user)

      repository = @user.repositories.last

      expect(repository.name).to eq("ruby-blog")
      expect(repository.principal_technology).to eq("Ruby")

      technology = repository.technologies.first
      expect(technology.language.description).to eq("Ruby")

      technology = repository.technologies.last
      expect(technology.language.description).to eq("CSS")
    end

  end

end
