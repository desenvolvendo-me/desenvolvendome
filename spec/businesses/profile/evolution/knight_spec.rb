require 'rails_helper'

RSpec.describe "Profile::Evolution::Knight" do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context "level" do

    it "1" do
      36.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(2808)
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      37.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(2886)
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it "8" do
      80.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(6240)
      expect(@user.profile.evaluation.level).to eq(8)
    end

    it "10" do
      95.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(7410)
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

end
