require 'rails_helper'

RSpec.describe "Profile::Generate" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
  end

  it "run" do
    Github::Importation.new.author(@user)
    Github::Importation.new.reposities(@user)
    Github::Importation.new.contributions(@user.repositories.last)

    Profile::Generate.new(@user).run

    expect(@user.profile.evaluation.started?).to be_truthy
    expect(@user.profile.evaluation.xp).to eq(40)
    expect(@user.profile.evaluation.level).to eq(2)
    expect(@user.profile.evaluation.versions.count).to eq(5)
    expect(@user.profile.evaluation.versions.find(1).changeset).to eq({"level" => [nil, 0], "evaluation_type" => [nil, "started"], "xp" => [nil, 0]})
    expect(@user.profile.evaluation.versions.find(6).changeset).to eq({"level" => [0, 1], "xp" => [0, 10]})
    expect(@user.profile.evaluation.versions.find(7).changeset).to eq({"xp" => [10, 20]})
    expect(@user.profile.evaluation.versions.find(8).changeset).to eq({"level" => [1, 2], "xp" => [20, 30]})
    expect(@user.profile.evaluation.versions.find(9).changeset).to eq({"xp" => [30, 40]})
  end
end