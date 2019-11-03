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
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 1" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 2" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 3" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 4" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "+ 5" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

  end

end
