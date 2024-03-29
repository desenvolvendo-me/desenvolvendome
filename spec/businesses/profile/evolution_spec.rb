require 'rails_helper'

RSpec.describe "Profile::Evolution" do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)

    @date_start = "01/01/2020".to_date
    @week = 0
  end

  context "level" do

    it 'started' do
      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      # Started

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(78)
      expect(@user.profile.evaluation.level).to eq(3)
      expect(@user.profile.evaluation.versions.count).to eq(2)

      repository = create(:repository, commits_count: 40, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 40, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      2.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      # Started

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(312)
      expect(@user.profile.evaluation.level).to eq(5)
      expect(@user.profile.evaluation.versions.count).to eq(5)
    end

    it 'novice' do
      # Started

      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(78)
      expect(@user.profile.evaluation.level).to eq(3)
      expect(@user.profile.evaluation.versions.count).to eq(2)

      # Novice

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      10.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      8.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(10)
      expect(@user.profile.evaluation.xp).to eq(1560)
      expect(@user.profile.evaluation.versions.count).to eq(22)

    end

    it 'knight' do
      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      # Started
      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(78)
      expect(@user.profile.evaluation.level).to eq(3)
      expect(@user.profile.evaluation.versions.count).to eq(2)

      # Novice

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      10.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      8.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 50, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      1.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.novice?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(1560)
      expect(@user.profile.evaluation.level).to eq(10)
      expect(@user.profile.evaluation.versions.count).to eq(22)

      # Knight

      repository = create(:repository, commits_count: 100, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      17.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 100, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      7.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      repository = create(:repository, commits_count: 100, user: @user)
      @contributor = create(:contributor, login: @user.login, repository: repository)
      10.times do |n|
        @week += 1
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: @date_start + (@week).week, contributor: @contributor)
      end

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.knight?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(4212)
      expect(@user.profile.evaluation.level).to eq(10)
      expect(@user.profile.evaluation.versions.count).to eq(57)

    end

  end

  def test

  end


end
