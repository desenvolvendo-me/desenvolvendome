require 'rails_helper'

RSpec.describe "Knight" do

  before(:each) do
    @user = create(:user, :with_profile)

    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
  end

  context "level" do

    it "1" do
      Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '10' do
      create(:repository, commits_count: 1000, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context "score" do
    it "+ 314" do
      create(:repository, commits_count: 14, user: @user)

      Evolution::Knight.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq(314)
    end

    it "+ 633" do
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 233, user: @user)

      Evolution::Knight.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq(633)
    end

    it "+ 2799" do
      create(:repository, commits_count: 1000, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 499, user: @user)

      Evolution::Knight.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq(2799)
    end

  end

end
