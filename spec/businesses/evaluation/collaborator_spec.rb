require 'rails_helper'

RSpec.describe "Collaborator" do

  before(:all) do
    @user = create(:user, :with_repository, :with_profile)
    Evaluation::Collaborator.new(@user).run
  end

  it "run" do
    evaluation =  @user.profile.evaluations.where(evaluation_type: :collaborator).take
    expect(evaluation.level).to eq(1)
  end

  it "score" do
    @user.repositories.first.update(stargazers_count: 500)

    Profile::Score.new(@user).run

    expect(@user.profile.score).to eq(3)
  end

end
