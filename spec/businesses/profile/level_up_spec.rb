require 'rails_helper'

RSpec.describe "LevelUp" do

  before(:each) do
    @user = create(:user, :with_profile)
  end

  context "level" do

    it 'novice' do
      create(:repository, commits_count: 14, user: @user)

      Evaluation::Started.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(1)

      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)

      Profile::LevelUp.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
      expect(@user.repositories.sum(:commits_count)).to eq(164)
    end

    it 'knight' do
      create(:repository, commits_count: 14, user: @user)

      Evaluation::Started.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("started")
      expect(@user.profile.evaluation.level).to eq(1)

      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)
      create(:repository, commits_count: 50, user: @user)

      Profile::LevelUp.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
      expect(@user.repositories.sum(:commits_count)).to eq(164)

      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 100, user: @user)
      create(:repository, commits_count: 100, user: @user)

      Profile::LevelUp.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("knight")
      expect(@user.profile.evaluation.level).to eq(1)
      expect(@user.repositories.sum(:commits_count)).to eq(464)
    end

  end


end
