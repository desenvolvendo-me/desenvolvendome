require 'rails_helper'

RSpec.describe "Profile::Evolution::Knight" do

  before(:each) do
    @user = create(:user, :with_profile)

    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
    create(:repository, commits_count: 100, user: @user)
  end

  context "level" do

    it "1" do
      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '10' do
      create(:repository, commits_count: 1000, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 200, user: @user)

      Profile::Evolution::Knight.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context "score" do
    it "+ 314" do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution::Knight.new(@user).run
      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq("314.0b")
    end

    it "+ 633" do
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 233, user: @user)

      Profile::Evolution::Knight.new(@user).run
      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq("633.0b")
    end

    it "+ 2799" do
      create(:repository, commits_count: 1000, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 500, user: @user)
      create(:repository, commits_count: 499, user: @user)

      Profile::Evolution::Knight.new(@user).run
      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.score).to eq("2.73kb")
    end

  end

end
