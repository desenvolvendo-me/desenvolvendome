require 'rails_helper'

RSpec.describe "Profile::Evolution::Novice" do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context "level" do

    it "1" do
      18.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(1404)
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      19.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(1482)
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it "8" do
      40.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(3120)
      expect(@user.profile.evaluation.level).to eq(8)
    end

    it "10" do
      57.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(4446)
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

end
