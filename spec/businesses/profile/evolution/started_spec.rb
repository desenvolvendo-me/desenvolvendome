require 'rails_helper'

RSpec.describe "Profile::Evolution::Started" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  context "level" do

    xit "1" do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(1)
    end

    xit "2" do
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

    it "+ 5" do
      repository = create(:repository, commits_count: 13, user: @user)
      contributor = create(:contributor, login: @user.login, repository: repository)
      create(:contribution, additions: 200, deletions: 0, commits: 1, contributor: contributor)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(5)
    end

  end

end
