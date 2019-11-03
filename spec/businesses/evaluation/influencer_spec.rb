require 'rails_helper'

RSpec.describe "Influencer" do

  before(:all) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "level" do

    it "0" do
      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      @user.update(followers: 1)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(1)
    end

    it '2' do
      @user.update(followers: 51)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(2)
    end

    it '3' do
      @user.update(followers: 101)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(3)
    end

    it '4' do
      @user.update(followers: 151)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(4)
    end

    it '5' do
      @user.update(followers: 201)

      Evaluation::Influencer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(evaluation.level).to eq(5)
    end

  end

  context "score" do

    it "+ 0" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 0.2" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 0.4" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 0.6" do
      @user.update(followers: 133)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.6)
    end

    it "+ 0.8" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 1" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

  end
end
