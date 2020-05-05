require 'rails_helper'

RSpec.describe "Github::Importation::Repo" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
    Github::Importation::Author.new.run(@user)
  end

  context "run" do

    it "ruby-blog create" do
      Github::Importation::Repo.new.run(@user)

      repository = @user.repositories.last
      expect(repository.name).to eq("ruby-blog")
      expect(repository.principal_technology).to eq("Ruby")
    end

  end

end
