require 'rails_helper'

RSpec.describe "Disciplinarian" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "level" do

    it "0" do
      @user.repositories.destroy_all

      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(1)
    end

    it '2' do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 500, principal_technology: "A", user: @user)

      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(2)
    end

    it '3' do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 1000, principal_technology: "A", user: @user)

      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(3)
    end

    it '4' do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 2000, principal_technology: "A", user: @user)

      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(4)
    end

    it '5' do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 5000, principal_technology: "A", user: @user)

      Evaluation::Disciplinarian.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
      expect(evaluation.level).to eq(5)
    end

  end

  context "score" do

    it "+ 0" do
      @user.repositories.destroy_all

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(0)
    end

    it "+ 1.2" do
      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.2)
    end

    it "+ 1.4" do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 500, principal_technology: "A", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.4)
    end

    it "+ 1.6" do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 1000, principal_technology: "A", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.6)
    end

    it "+ 1.8" do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 2000, principal_technology: "A", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.8)
    end

    it "+ 2" do
      @user.repositories.destroy_all
      @user.repositories << create(:repository, :with_technologies, commits_count: 5000, principal_technology: "A", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(2)
    end

  end

end
