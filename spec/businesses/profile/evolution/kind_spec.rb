require 'rails_helper'

RSpec.describe 'Profile::Evolution::Kind' do

  before(:each) do
    @settings = {
        min_level: 1,
        max_level: 10,
        role: {
            kind: :started,
            calc: 25,
            repository_size: 50,
            commits_preview: 0,
            level_up: {
                repositories: 3,
                xp: 1375
            }
        }
    }
    @user = create(:user, :with_profile)
    repository = create(:repository, commits_count: 13, user: @user)
    @contributor = create(:contributor, login: @user.login, repository: repository)
  end

  context 'level' do
    pending "pendente #{__FILE__}"
  end

  context 'level_up' do
    pending "pendente #{__FILE__}"
  end

  context 'next_level' do
    pending "pendente #{__FILE__}"
  end

  context 'calculating_xp' do

    context 'minimo semanal' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 5, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:calculating_xp)

        expect(xp).to eq(10)
      end

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 6, commits: 12, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:calculating_xp)

        expect(xp).to eq(10)
      end
    end

    context 'mês' do

      it '+ 10' do
        create(:contribution, additions: 50, deletions: 5, commits: 6, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:calculating_xp)

        expect(xp).to eq(10)
      end

      it '+ 10' do
        create(:contribution, additions: 75, deletions: 10, commits: 1, period: '07/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:calculating_xp)

        expect(xp).to eq(10)
      end

    end

    context 'máxima semanal' do

      it '+ 78' do
        create(:contribution, additions: 325, deletions: 60, commits: 30, period: '01/01/2020'.to_datetime, contributor: @contributor)

        xp = Profile::Evolution::Kind.new(@user, @settings).send(:calculating_xp)

        expect(xp).to eq(78)
      end

    end

  end

  context 'repositories' do
    pending "pendente #{__FILE__}"
  end
  context 'xp_next_level' do
    pending "pendente #{__FILE__}"
  end

  context 'max' do
    pending "pendente #{__FILE__}"
  end

  context 'calculate' do
    pending "pendente #{__FILE__}"
  end

  context 'commit_minimun' do
    pending "pendente #{__FILE__}"
  end

  context 'proportion_minimal' do
    pending "pendente #{__FILE__}"
  end

  context 'weekly_minimum' do
    pending "pendente #{__FILE__}"
  end

  context 'levels' do
    pending "pendente #{__FILE__}"
  end


end
