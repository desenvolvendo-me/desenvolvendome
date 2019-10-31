require 'rails_helper'

RSpec.describe "Programmer" do

  before(:all) do
    @user = create(:user, :with_repository, :with_profile)
    Evaluation::Programmer.new(@user).run
  end

  it "run" do
    evaluation =  @user.profile.evaluations.where(evaluation_type: :programmer).take
    expect(evaluation.level).to eq(2)
  end

  it "score" do
    @user.profile.knowledges.first.update(experience: 10)

    Profile::Score.new(@user).run

    expect(@user.profile.score).to eq(1.4)
  end


end
