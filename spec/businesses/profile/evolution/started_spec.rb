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
      expect(@user.profile.evaluation.xp).to eq(17)
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it '2' do
      create(:contribution, additions: 100, deletions: 20, commits: 3, period: '01/01/2020'.to_datetime, contributor: @contributor)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(25)
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '8' do
      10.times do |n|
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: "#{n+1}/01/2020".to_datetime, contributor: @contributor)
      end

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(779)
      expect(@user.profile.evaluation.level).to eq(8)
    end

    it '10' do
      10.times do |n|
        create(:contribution, additions: 1200, deletions: 200, commits: 193, period: "#{n+1}/01/2020".to_datetime, contributor: @contributor)
      end

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(1379)
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context 'xp' do

    context 'minimo semanal' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 5, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(10)
      end

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 6, commits: 12, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(10)
      end
    end

    context 'mês' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 6, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(10)
      end

      it '+ 12' do
        create(:contribution, additions: 75, deletions: 10, commits: 1, period: '07/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(12)
      end

      it '+ 17' do
        create(:contribution, additions: 100, deletions: 15, commits: 2, period: '14/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(17)
      end

      it '+ 14' do
        create(:contribution, additions: 125, deletions: 20, commits: 2, period: '21/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(14)
      end

    end

    context 'máxima semanal' do

      it '+ 78' do
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: '01/01/2020'.to_datetime, contributor: @contributor)

        Profile::Evolution::Started.new(@user).run

        expect(@user.profile.evaluation.started?).to be_truthy
        expect(@user.profile.evaluation.xp).to eq(78)
      end

    end

  end

end
