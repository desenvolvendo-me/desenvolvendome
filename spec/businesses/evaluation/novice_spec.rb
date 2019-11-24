require 'rails_helper'

RSpec.describe "Novice" do

  before(:each) do
    @user = create(:user, :with_profile)

    create(:repository, commits_count: 50, user: @user)
    create(:repository, commits_count: 50, user: @user)
    create(:repository, commits_count: 50, user: @user)
  end

  context "level" do

    it "1" do
      Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)

      Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(2)
    end

    it '10' do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 11, user: @user)
      create(:repository, commits_count: 40, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 8, user: @user)

      Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

  context "score" do
    it "+ 164" do
      create(:repository, commits_count: 14, user: @user)

      Evolution::Novice.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.score).to eq(164)
    end

    it "+ 165" do
      create(:repository, commits_count: 15, user: @user)

      Evolution::Novice.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.score).to eq(165)
    end

    it "+ 300" do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 11, user: @user)
      create(:repository, commits_count: 49, user: @user)

      Evolution::Novice.new(@user).run
      Profile::Score.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.score).to eq(300)
    end

  end

end
