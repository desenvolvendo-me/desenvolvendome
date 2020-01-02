# == Schema Information
#
# Table name: compares
#
#  id                 :bigint           not null, primary key
#  comparations_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  compared_id        :integer
#  user_id            :integer
#

require 'rails_helper'

RSpec.describe Compare, type: :model do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
    @compared = create(:user, :with_repositories, :with_profile)

    langs = ["Portugol", "Abap", "CSS"]

    create(:knowledge, level: 100, profile: @user.profile, experience: 25, language: create(:language, description: "Ruby"))
    @user.profile.knowledges.each_with_index do |knowledge, index|
      knowledge.update(level: index * 10, language_id: Language.where(description: langs[index]).take.id) if langs[index]
    end

    create(:knowledge, level: 100, profile: @compared.profile, experience: 25, language: create(:language, description: "Python"))
    @compared.profile.knowledges.each_with_index do |knowledge, index|
      knowledge.update(level: index * 10, language_id: Language.where(description: langs[index]).take.id) if langs[index]
    end

  end

  it "compare" do
    languages_all_user = @user.profile.knowledges.pluck(:language_id)
    languages_all_compared = @compared.profile.knowledges.each.pluck(:language_id)
    languages_diff_user = languages_all_user - languages_all_compared
    languages_diff_compared = languages_all_compared - languages_all_user

    languages_eq = languages_all_user - (languages_diff_user + languages_diff_compared)

    expect(@user.profile.knowledges.first.language.description).to eq("Portugol")
    expect(@compared.profile.knowledges.first.language.description).to eq("Portugol")
    expect(@user.profile.knowledges.last.language.description).to eq("Ruby")
    expect(@compared.profile.knowledges.last.language.description).to eq("Python")

  end
end
