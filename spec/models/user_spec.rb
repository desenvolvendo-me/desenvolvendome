# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  email      :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  office     :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#
# Indexes
#
#  index_users_on_slug  (slug) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  it "user evaluation not_evaluation" do
    expect(@user.name).to eq("Marco")
    expect(@user.login).to eq("marcodotcastro")
    expect(@user.office).to eq("fullstack")
    expect(@user.followers).to eq(0)
    expect(@user.following).to eq(0)

    expect(@user.repositories.count).to eq(2)
    repository = @user.repositories.last
    expect(repository.name).to eq("hello_world")

    technology = repository.technologies.first
    expect(technology.exercise).to eq(5500)
    expect(technology.language.description).to eq("Portugol")

    expect(@user.profile.score).to eq(5.5)
    evaluation = @user.profile.evaluations.first
    expect(evaluation.level).to eq(1)
    expect(evaluation.evaluation_type).to eq("not_evaluation")
  end

  context "user influencer" do

    it "level 0 and score and score" do
      #DADO

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(1.0)
      expect(evaluation.level).to eq(0)
      expect(evaluation.evaluation_type).to eq("influencer")
    end

    it "level 1 and score" do
      #DADO

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(1.0)
      expect(evaluation.level).to eq(0)
      expect(evaluation.evaluation_type).to eq("influencer")
    end

    it "level 2 and score" do
      #DADO
      @user.update(followers: 51)

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(1.4)
      expect(evaluation.level).to eq(2)
      expect(evaluation.evaluation_type).to eq("influencer")
    end

    it "level 3 and score" do
      #DADO
      @user.update(followers: 101)

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(1.6)
      expect(evaluation.level).to eq(3)
      expect(evaluation.evaluation_type).to eq("influencer")
    end

    it "level 4 and score" do
      #DADO
      @user.update(followers: 151)

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(1.8)
      expect(evaluation.level).to eq(4)
      expect(evaluation.evaluation_type).to eq("influencer")
    end

    it "level 5 and score" do
      #DADO
      @user.update(followers: 201)

      #QUANDO
      Evaluation::Influencer.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :influencer).take
      expect(@user.profile.score).to eq(2)
      expect(evaluation.level).to eq(5)
      expect(evaluation.evaluation_type).to eq("influencer")
    end
  end

  context "user programmer" do

    it "level 1 and score" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "level 2 and score" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "level 3 and score" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "level 4 and score" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

    it "level 5 and score" do
      pending "pendente #{__FILE__}"
      this_should_not_get_executed
    end

  end

  context "user collaborator" do

    it "level 0 and score" do
      #DADO

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(1.0)
      expect(evaluation.level).to eq(0)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end

    it "level 1 and score" do
      #DADO
      @user.repositories.first.update(stargazers_count: 50)

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(1.2)
      expect(evaluation.level).to eq(1)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end

    it "level 2 and score" do
      #DADO
      @user.repositories.first.update(stargazers_count: 100)

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(1.4)
      expect(evaluation.level).to eq(2)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end

    it "level 3 and score" do
      #DADO
      @user.repositories.first.update(stargazers_count: 500)

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(1.6)
      expect(evaluation.level).to eq(3)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end

    it "level 4 and score" do
      #DADO
      @user.repositories.first.update(stargazers_count: 1000)

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(1.8)
      expect(evaluation.level).to eq(4)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end

    it "level 5 and score" do
      #DADO
      @user.repositories.first.update(stargazers_count: 5000)

      #QUANDO
      Evaluation::Collaborator.new(@user).run
      Profile::Score.new(@user).run

      #ENTÃO
      evaluation = @user.profile.evaluations.where(evaluation_type: :collaborator).take
      expect(@user.profile.score).to eq(2)
      expect(evaluation.level).to eq(5)
      expect(evaluation.evaluation_type).to eq("collaborator")
    end
  end

end
