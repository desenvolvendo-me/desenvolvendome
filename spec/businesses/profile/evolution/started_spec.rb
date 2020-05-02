require 'rails_helper'

RSpec.describe 'Profile::Evolution::Started' do

  before(:each) do
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context 'level' do

    it '1' do
      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it '2' do
      create(:contribution, additions: 13, deletions: 2, commits: 1, contributor: @contributor)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(5)
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

  context 'xp' do

    context '1 mês' do

      it '+ 0' do
        create(:contribution, additions: 1, deletions: 0, commits: 1, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(0)
      end

      it '+ 1' do
        create(:contribution, additions: 5, deletions: 0, commits: 1, period: '07/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(1)
      end

      it '+ 3' do
        create(:contribution, additions: 25, deletions: 0, commits: 1, period: '14/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(3)
      end

      it '+ 5' do
        create(:contribution, additions: 50, deletions: 0, commits: 1, period: '21/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(5)
      end

    end

    context '2 mês' do

      it '+ 8' do
        create(:contribution, additions: 75, deletions: 3, commits: 4, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(8)
      end

      it '+ 10' do
        create(:contribution, additions: 100, deletions: 4, commits: 5, period: '07/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(10)
      end

      it '+ 13' do
        create(:contribution, additions: 125, deletions: 5, commits: 6, period: '14/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(13)
      end

      it '+ 16' do
        create(:contribution, additions: 150, deletions: 6, commits: 7, period: '21/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(16)
      end

    end

    context '3 mês' do

      it '+ 18' do
        create(:contribution, additions: 175, deletions: 7, commits: 8, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(18)
      end

      it '+ 21' do
        create(:contribution, additions: 200, deletions: 8, commits: 9, period: '07/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(21)
      end

      it '+ 23' do
        create(:contribution, additions: 225, deletions: 9, commits: 10, period: '14/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(23)
      end

      it '+ 26' do
        create(:contribution, additions: 250, deletions: 10, commits: 11, period: '21/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(26)
      end

    end

  end

end
