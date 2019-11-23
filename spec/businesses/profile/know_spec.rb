require 'rails_helper'

RSpec.describe "Know" do

  before(:all) do
    @user = create(:user, :with_profile)
  end

  context "knowledge type" do

    it "basic" do
      repository = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "HTML")
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :basic).first
      expect(knowledge.language.description).to eq("HTML")
    end

    it "normal" do
      repository = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "Ruby")
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :normal).first
      expect(knowledge.language.description).to eq("Ruby")
    end

    it "rare" do
      repository = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "C")
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :rare).first
      expect(knowledge.language.description).to eq("C")
    end

    it "special" do
      repository = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "Go")
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :special).first
      expect(knowledge.language.description).to eq("Go")
    end

  end

  context "knowledge level" do

    it "1" do
      repository = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "HTML")
      create(:technology, repository: repository, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :basic).first
      expect(knowledge.level).to eq(1)
      expect(knowledge.language.description).to eq("HTML")
    end

    it "2" do
      repository1 = create(:repository, commits_count: 15, user: @user)
      repository2 = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "Ruby")
      create(:technology, repository: repository1, exercise: 5500, language: language)
      create(:technology, repository: repository2, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :normal).first
      expect(knowledge.level).to eq(2)
      expect(knowledge.language.description).to eq("Ruby")
    end

    it "3" do
      repository1 = create(:repository, commits_count: 15, user: @user)
      repository2 = create(:repository, commits_count: 15, user: @user)
      repository3 = create(:repository, commits_count: 15, user: @user)
      language = create(:language, description: "C")
      create(:technology, repository: repository1, exercise: 5500, language: language)
      create(:technology, repository: repository2, exercise: 5500, language: language)
      create(:technology, repository: repository3, exercise: 5500, language: language)

      Evaluation::Know.new(@user).run

      knowledge = @user.profile.knowledges.where(knowledge_type: :rare).first
      expect(knowledge.level).to eq(3)
      expect(knowledge.language.description).to eq("C")
    end

  end


end
