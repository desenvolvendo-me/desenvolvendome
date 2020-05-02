require 'rails_helper'

RSpec.describe "Profile::Evolution::Knight" do

  before(:each) do
    @user = create(:user, :with_profile)

    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
  end

  context "level" do

    it "1" do
      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '10' do
      create(:repository, commits_count: 1000, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context "xp" do
    it "+ 57" do
      repository = create(:repository, commits_count: 13, user: @user)
      contributor = create(:contributor, login: @user.login, repository: repository)
      create(:contribution, additions: 20, deletions: 4, commits: 1, contributor: contributor)
      create(:contribution, additions: 15, deletions: 0, commits: 1, contributor: contributor)
      create(:contribution, additions: 10, deletions: 3, commits: 1, contributor: contributor)
      create(:contribution, additions: 25, deletions: 5, commits: 1, contributor: contributor)
      create(:contribution, additions: 5, deletions: 1, commits: 1, contributor: contributor)

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(57)
    end

  end

end
