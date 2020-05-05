require 'rails_helper'

RSpec.describe "Github::Importation" do

  before(:each) do
    @user = create(:user, login: "desenvolvendome")
  end

  it "author" do
    Github::Importation.new.author(@user)

    expect(@user.name).to eq("Desenvolvendo Me")
    expect(@user.login).to eq("desenvolvendome")
    expect(@user.followers).to eq(1)
    expect(@user.following).to eq(1)
  end

  it "reposities" do
    Github::Importation.new.reposities(@user)

    repository = @user.repositories.last
    expect(repository.name).to eq("ruby-blog")
    expect(repository.principal_technology).to eq("Ruby")

    expect(repository.technologies.count).to eq(4)

    technology = repository.technologies.first
    expect(technology.exercise).to eq(32120)
    expect(technology.language.description).to eq("Ruby")

    technology = repository.technologies.last
    expect(technology.exercise).to eq(709)
    expect(technology.language.description).to eq("CSS")
  end

  it "contributions" do
    Github::Importation.new.reposities(@user)

    repository = @user.repositories.last

    Github::Importation.new.contributions(repository)

    expect(repository.commits_count).to eq(8)
  end

  context "erros" do
    it "desenvolvendome" do
      user = create(:user, :with_profile, login: "desenvolvendome")
      repository = create(:repository, name: "ruby-blog", user: user)

      Github::Importation.new.contributions(repository)
      Github::Importation.new.contributions(repository)

      expect(repository.contributors.count).to eq(2)
      expect(repository.commits_count).to eq(8)
    end

    it "marcodotcastro" do
      user = create(:user, :with_profile, login: "marcodotcastro")
      repository = create(:repository, name: "curriculum", user: user)

      Github::Importation.new.contributions(repository)

      Profile::Evolution.new(user).run

      repository = create(:repository, name: "dev.me", user: user)

      Github::Importation.new.contributions(repository)

      Profile::Evolution.new(user).run

      expect(user.profile.evaluation.xp).to eq(40)
    end
  end


end
