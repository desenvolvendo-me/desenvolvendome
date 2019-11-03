require 'rails_helper'

RSpec.describe "Collaborator" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "level" do

    it "0" do
      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      @user.repositories.first.update(stargazers_count: 50)

      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(1)
    end

    it '2' do
      @user.repositories.first.update(stargazers_count: 100)

      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(2)
    end

    it '3' do
      @user.repositories.first.update(stargazers_count: 500)

      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(3)
    end

    it '4' do
      @user.repositories.first.update(stargazers_count: 1000)

      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(4)
    end

    it '5' do
      @user.repositories.first.update(stargazers_count: 5000)

      Evaluation::Collaborator.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(5)
    end

  end

  context "score" do

    it "+ 1" do
      @user.repositories.first.update(stargazers_count: 1)

       Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1)
    end

    it "+ 1.2" do
      @user.repositories.first.update(stargazers_count: 50)

       Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.2)
    end

    it "+ 1.4" do
      @user.repositories.first.update(stargazers_count: 100)

       Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.4)
    end

    it "+ 1.6" do
      @user.repositories.first.update(stargazers_count: 500)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.6)
    end

    it "+ 1.8" do
      @user.repositories.first.update(stargazers_count: 1000)

       Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(1.8)
    end

    it "+ 2" do
      @user.repositories.first.update(stargazers_count: 5000)

       Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(2)
    end

  end

end
