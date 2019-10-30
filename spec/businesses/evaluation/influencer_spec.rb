require 'rails_helper'

RSpec.describe "Influencer" do

  before(:all) do
    @user = create(:user, :with_repository, :with_profile)
    Evaluation::Influencer.new(@user).run
  end

  it "run" do
    evaluation =  @user.profile.evaluations.where(evaluation_type: :influencer).take
    expect(evaluation.level).to eq(1)
  end


end
