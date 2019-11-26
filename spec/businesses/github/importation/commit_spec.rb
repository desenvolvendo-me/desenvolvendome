require 'rails_helper'

RSpec.describe "Github::Importation::Commit" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
    Github::Importation::User.new.run(@user)
    Github::Importation::Repo.new.run(@user)
  end

  context "run" do

    it "ruby-blog commit desenvolvendome" do
      Github::Importation::Commit.new.run(@user)

      repository = @user.repositories.last
      expect(repository.commits_count).to eq(1)
    end

  end

end
