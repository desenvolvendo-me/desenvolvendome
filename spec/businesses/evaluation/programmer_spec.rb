require 'rails_helper'

RSpec.describe "Programmer" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "level" do

    it "0" do
      @user.repositories.destroy_all

      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(1)
    end

    it '2' do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)

      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(2)
    end

    it '3' do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)

      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(3)
    end

    it '4' do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "C", user: @user)

      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(4)
    end

    it '5' do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "C", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "D", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "E", user: @user)

      Evaluation::Programmer.new(@user).run

      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
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

    it "+ 2.2" do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(2.2)
    end

    it "+ 3.2" do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(3.2)
    end

    it "+ 4.2" do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "C", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(4.2)
    end

    it "+ 5.2" do
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "A", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "B", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "C", user: @user)
      @user.repositories << create(:repository, :with_technologies, commits_count: 250, principal_technology: "D", user: @user)

      Profile::Score.new(@user).run

      expect(@user.profile.score).to eq(5.2)
    end

  end

end
