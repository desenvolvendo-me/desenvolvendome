require 'rails_helper'

RSpec.describe "Profile::Evolution" do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context "level" do

    it 'started' do
      1.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n+1).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(3)

      repository = create(:repository, commits_count: 40, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      1.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n+1).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 40, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      2.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n+1).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(4)
    end

    it 'novice' do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(1)

      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 15, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
      expect(@user.repositories.sum(:commits_count)).to eq(179)
    end

    it 'knight' do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(1)

      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 15, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
      expect(@user.repositories.sum(:commits_count)).to eq(179)

      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 177, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(2)
      expect(@user.repositories.sum(:commits_count)).to eq(656)
    end

  end


end
