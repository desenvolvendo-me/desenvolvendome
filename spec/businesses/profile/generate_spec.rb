require 'rails_helper'

RSpec.describe "Profile::Generate" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
  end

  context "user real" do

    xit "repositorio first and last" do
      Github::Importation.new.author(@user)
      Github::Importation.new.reposities(@user)
      Github::Importation.new.contributions(@user.repositories.first)

      Profile::Generate.new(@user).run

      Github::Importation.new.contributions(@user.repositories.last)

      Profile::Generate.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(50)
      expect(@user.profile.evaluation.level).to eq(2)
      expect(@user.profile.evaluation.versions.count).to eq(6)
      expect(@user.profile.evaluation.versions.first.changeset).to eq({"level" => [nil, 0], "evaluation_type" => [nil, "started"], "xp" => [nil, 0]})
      expect(@user.profile.evaluation.versions.last.changeset).to eq({"xp" => [40, 50]})
    end

    xit "repositorio last and first" do
      Github::Importation.new.author(@user)
      Github::Importation.new.reposities(@user)
      Github::Importation.new.contributions(@user.repositories.last)

      Profile::Generate.new(@user).run

      Github::Importation.new.contributions(@user.repositories.first)

      Profile::Generate.new(@user).run

      expect(@user.profile.evaluation.started?).to be_truthy
      expect(@user.profile.evaluation.xp).to eq(50)
      expect(@user.profile.evaluation.level).to eq(2)
      expect(@user.profile.evaluation.versions.count).to eq(6)
      expect(@user.profile.evaluation.versions.first.changeset).to eq({"level" => [nil, 0], "evaluation_type" => [nil, "started"], "xp" => [nil, 0]})
      expect(@user.profile.evaluation.versions.last.changeset).to eq("xp"=>[40, 50])
    end

  end
end