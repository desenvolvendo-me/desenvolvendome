require 'rails_helper'

RSpec.describe "Evolution" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  context "level" do

    it 'started' do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(1)

      create(:repository, commits_count: 40, user: @user)
      create(:repository, commits_count: 40, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(7)
      expect(@user.repositories.sum(:commits_count)).to eq(94)
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

    it 'marcodotcastro' do
      create(:repository, commits_count: 48, user: @user)
      create(:repository, commits_count: 68, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 4, user: @user)
      create(:repository, commits_count: 6, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 39, user: @user)
      create(:repository, commits_count: 88, user: @user)
      create(:repository, commits_count: 61, user: @user)
      create(:repository, commits_count: 212, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 3, user: @user)
      create(:repository, commits_count: 86, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 39, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(10)
      expect(@user.repositories.sum(:commits_count)).to eq(656)
    end

    it 'MoacirPetry' do
      create(:repository, commits_count: 48, user: @user)
      create(:repository, commits_count: 5, user: @user)
      create(:repository, commits_count: 25, user: @user)
      create(:repository, commits_count: 4, user: @user)
      create(:repository, commits_count: 4, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 5, user: @user)
      create(:repository, commits_count: 29, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 26, user: @user)
      create(:repository, commits_count: 124, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(10)
      expect(@user.repositories.sum(:commits_count)).to eq(285)
    end

    it 'leonnleite' do
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 21, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 6, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 6, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 3, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 4, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 5, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 3, user: @user)
      create(:repository, commits_count: 9, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 3, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 2, user: @user)
      create(:repository, commits_count: 1, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 0, user: @user)
      create(:repository, commits_count: 1, user: @user)

      Profile::Evolution.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(7)
      expect(@user.repositories.sum(:commits_count)).to eq(94)
    end

  end


end
