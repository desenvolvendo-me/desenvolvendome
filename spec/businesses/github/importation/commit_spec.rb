require 'rails_helper'

RSpec.describe "Github::Importation::Commit" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
    Github::Importation::Author.new.run(@user)
    Github::Importation::Repo.new.run(@user)
  end

  context "run" do

    it "ruby-blog commits" do
      repository = @user.repositories.last

      Github::Importation::Commit.new.run(repository)

      expect(repository.commits_count).to eq(8)
    end

    it "ruby-blog additions" do
      repository = @user.repositories.last

      Github::Importation::Commit.new.run(repository)

      expect(repository.additions_count).to eq(6)
    end

    it "ruby-blog deletions" do
      repository = @user.repositories.last

      Github::Importation::Commit.new.run(repository)

      expect(repository.deletions_count).to eq(27)
    end
  end

end
