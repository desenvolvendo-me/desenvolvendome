require 'rails_helper'

RSpec.describe 'Profile::Evolution::Started' do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context 'level' do

    it '1' do
      create(:contribution, additions: 100, deletions: 20, commits: 2, period: '01/01/2020'.to_datetime, contributor: @contributor)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(10)
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it '2' do
      create(:contribution, additions: 100, deletions: 20, commits: 3, period: '01/01/2020'.to_datetime, contributor: @contributor)
      create(:contribution, additions: 100, deletions: 20, commits: 3, period: '08/01/2020'.to_datetime, contributor: @contributor)
      create(:contribution, additions: 100, deletions: 20, commits: 3, period: '15/01/2020'.to_datetime, contributor: @contributor)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(30)
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '8' do
      10.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(780)
      expect(@user.profile.evaluation.level).to eq(8)
    end

    it '10' do
      18.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "01/01/2020".to_date + (n + 1).week, contributor: @contributor)
      end

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(1404)
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

end
