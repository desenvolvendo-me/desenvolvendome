require 'rails_helper'

RSpec.describe "Profile::Evolution::Started" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  context "level" do

    it "1" do
      create(:repository, commits_count: 14, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 15, user: @user)

      Profile::Evolution::Started.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
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

  context "score" do

    it "+ 0" do
      create(:repository, commits_count: 14, user: @user)

      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.score).to eq("14.0b")
    end

    it "+ 15" do
      create(:repository, commits_count: 15, user: @user)

      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.score).to eq("15.0b")
    end

    it "+ 150" do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 30, user: @user)
      create(:repository, commits_count: 11, user: @user)
      create(:repository, commits_count: 49, user: @user)

      Profile::Rating::Score.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.score).to eq("150.0b")
    end

  end

end
