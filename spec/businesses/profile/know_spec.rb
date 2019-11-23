require 'rails_helper'

RSpec.describe "Know" do

  before(:all) do
    @user = create(:user, :with_profile)
  end

  context "language type" do

    it "basic" do
      language = create(:language, description: "HTML")
      repository = create(:repository, commits_count: 15, user: @user)
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :basic).first
      expect(knowledge.language.description).to eq("HTML")
    end

    it "normal" do
      language = create(:language, description: "Ruby")
      repository = create(:repository, commits_count: 15, user: @user)
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :normal).first
      expect(knowledge.language.description).to eq("Ruby")
    end

    it "rare" do
      language = create(:language, description: "C")
      repository = create(:repository, commits_count: 15, user: @user)
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :rare).first
      expect(knowledge.language.description).to eq("C")
    end

    it "special" do
      language = create(:language, description: "Go")
      repository = create(:repository, commits_count: 15, user: @user)
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :special).first
      expect(knowledge.language.description).to eq("Go")
    end

  end

end
