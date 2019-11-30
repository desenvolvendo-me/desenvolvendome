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
    end

    it "php-blog create" do
      Github::Importation::Repo.new.run(@user)

      repository = @user.repositories.first
      expect(repository.name).to eq("php-blog")
      expect(repository.principal_technology).to eq("PHP")
    end

  end

end
