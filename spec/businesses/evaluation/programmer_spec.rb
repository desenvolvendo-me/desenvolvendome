require 'rails_helper'

RSpec.describe "Programmer" do

  before(:all) do
    @user = create(:user, :with_repositories, :with_profile)
    Evaluation::Programmer.new(@user).run
  end

  context "level" do

    it "0" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it '1' do
      evaluation = @user.profile.evaluations.where(evaluation_type: :programmer).take
      expect(evaluation.level).to eq(1)
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
