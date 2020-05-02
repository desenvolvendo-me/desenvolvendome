require 'rails_helper'

RSpec.describe "Profile::Evolution::Novice" do

  before(:each) do
    @user = create(:user, :with_profile)

    create(:repository, commits_count: 50, user: @user)
    create(:repository, commits_count: 50, user: @user)
    create(:repository, commits_count: 50, user: @user)
  end

  context "level" do

    it "1" do
      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(1)
    end

    it "2" do
      create(:repository, commits_count: 15, user: @user)
      create(:repository, commits_count: 15, user: @user)

      Profile::Evolution::Novice.new(@user).run

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

      Profile::Evolution::Novice.new(@user).run

      expect(@user.profile.evaluation.evaluation_type).to eq("novice")
      expect(@user.profile.evaluation.level).to eq(10)
    end

  end

end
