require 'rails_helper'

RSpec.describe 'Profile::Evolution::Kind' do

  before(:each) do
    @settings = {}
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context 'xp' do

    context 'minimo semanal' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 5, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(10)
      end

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 6, commits: 12, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(10)
      end
    end

    context 'mês' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 6, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(10)
      end

      it '+ 12' do
        create(:contribution, additions: 75, deletions: 10, commits: 1, period: '07/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(12)
      end

      it '+ 17' do
        create(:contribution, additions: 100, deletions: 15, commits: 2, period: '14/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(17)
      end

      it '+ 14' do
        create(:contribution, additions: 125, deletions: 20, commits: 2, period: '21/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(14)
      end

    end

    context 'máxima semanal' do

      it '+ 78' do
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:xp)

        expect(xp).to eq(78)
      end

    end

  end

end
