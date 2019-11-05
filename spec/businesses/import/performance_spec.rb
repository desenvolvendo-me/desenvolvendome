require 'rails_helper'

RSpec.describe "Performance" do

  context "api" do

    it 'user' do
      @api_github = Api::Github.new

      user = nil
      login = "desenvolvendome"

      expect {user = @api_github.user(login)}.to perform_under(1).sec
      expect(user['name']).to eq("Desenvolvendo Me")
    end

  end

  context "import" do

    it "desenvolvendome" do
      @user = create(:user, login: "desenvolvendome")

      expect {Import::Github.new.run(@user)}.to perform_under(10).sec

      expect(@user.name).to eq("Desenvolvendo Me")
      expect(@user.login).to eq("desenvolvendome")
      expect(@user.followers).to eq(1)
      expect(@user.following).to eq(1)

      expect(@user.repositories.count).to eq(2)

      repository = @user.repositories.last
      expect(repository.name).to eq("ruby-blog")
      expect(repository.principal_technology).to eq("Ruby")

      technology = repository.technologies.first
      expect(technology.exercise).to eq(32120)
      expect(technology.language.description).to eq("Ruby")

      technology = repository.technologies.last
      expect(technology.exercise).to eq(709)
      expect(technology.language.description).to eq("CSS")
      repository = @user.repositories.first
      expect(repository.name).to eq("php-blog")
      expect(repository.principal_technology).to eq("PHP")

      technology = repository.technologies.first
      expect(technology.exercise).to eq(86149)
      expect(technology.language.description).to eq("PHP")

      technology = repository.technologies.last
      expect(technology.exercise).to eq(3)
      expect(technology.language.description).to eq("CSS")
    end

  end


end
