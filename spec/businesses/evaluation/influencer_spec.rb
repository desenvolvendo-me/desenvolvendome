require 'rails_helper'

RSpec.describe "Influencer" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "level" do

    it "0" do
      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      @user.update(followers: 101)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(1)
    end

    it '2' do
      @user.update(followers: 201)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(2)
    end

    it '3' do
      @user.update(followers: 301)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(3)
    end

    it '4' do
      @user.update(followers: 401)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(4)
    end

    it '5' do
      @user.update(followers: 501)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(5)
    end

  end

  context "score" do

    it "+ 1.2" do
      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.2)
    end

    it "+ 1.4" do
      @user.update(followers: 101)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.4)
    end

    it "+ 1.6" do
      @user.update(followers: 201)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.6)
    end

    it "+ 1.8" do
      @user.update(followers: 301)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.8)
    end

    it "+ 2.0" do
      @user.update(followers: 401)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(2.0)
    end

    it "+ 2.2" do
      @user.update(followers: 501)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(2.2)
    end

  end
end
