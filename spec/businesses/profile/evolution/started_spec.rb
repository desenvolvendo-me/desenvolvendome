require 'rails_helper'

RSpec.describe "Profile::Evolution::Started" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  context "level" do

    it "1" do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 15, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '10' do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 11, user: @user)
      create(:repository, commits_count: 40, user: @user)
      create(:repository, commits_count: 8, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context "xp" do

    it "+ " do
      contribution = create(:contribution, additions: 33, deletions: 10, commits: 13)
      repository = create(:repository, commits_count: 13, user: @user)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq("13.0b")
    end

    it "+ 150" do
      contribution1 = create(:contribution, additions: 290, deletions: 10, commits: 23)
      contribution2 = create(:contribution, additions: 130, deletions: 21, commits: 14)
      contribution3 = create(:contribution, additions: 250, deletions: 27, commits: 28)
      contribution4 = create(:contribution, additions: 339, deletions: 11, commits: 25)
      contribution5 = create(:contribution, additions: 133, deletions: 20, commits: 27)
      contribution6 = create(:contribution, additions: 190, deletions: 24, commits: 19)

      repository = create(:repository, commits_count: 13, user: @user)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution1)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution2)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution3)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution4)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution5)
      create(:contributor, login: @user.login, repository: repository, contribution: contribution6)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq("150.0b")
    end

    it "+ 1120" do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 11, user: @user)
      create(:repository, commits_count: 49, user: @user)
      create(:repository, commits_count: 1000, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq("1.12kb")
    end
  end

end
