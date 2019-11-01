require 'rails_helper'

RSpec.describe "Collaborator" do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
    Evaluation::Collaborator.new(@user).run
  end

  context "level" do

    it "0" do
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(evaluation.level).to eq(0)
    end

    it '1' do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it '2' do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it '3' do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it '4' do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it '5' do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

  end

  it "run" do
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
      @user.repositories.first.update(stargazers_count: 500)

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
