# == Schema Information
#
# Table name: knowledges
#
#  id             :bigint           not null, primary key
#  experience     :float
#  knowledge_type :integer
#  level          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  language_id    :bigint
#  profile_id     :bigint
#
# Indexes
#
#  index_knowledges_on_language_id  (language_id)
#  index_knowledges_on_profile_id   (profile_id)
#

require 'rails_helper'

def check_rarity(percente)
  case (percente)
  when 90..100
    rarity = :very_low
  when 70..89
    rarity = :low
  when 30..69
    rarity = :medium
  when 10..29
    rarity = :high
  when 0..9
    rarity = :very_high
  end
  rarity
end

RSpec.describe Knowledge, type: :model do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "calc_language_ratiry" do

    it 'rarity 91' do
      percente = 91

      rarity = check_rarity(percente)

      expect(rarity).to eq(:very_low)
    end

    it 'rarity 71' do
      percente = 71

      rarity = check_rarity(percente)

      expect(rarity).to eq(:low)
    end

    it 'rarity 45' do
      percente = 45

      rarity = check_rarity(percente)

      expect(rarity).to eq(:medium)
    end

    it 'rarity 45' do
      percente = 45

      rarity = check_rarity(percente)

      expect(rarity).to eq(:medium)
    end

    it 'rarity 12' do
      percente = 12

      rarity = check_rarity(percente)

      expect(rarity).to eq(:high)
    end

    it 'rarity 1' do
      percente = 1

      rarity = check_rarity(percente)

      expect(rarity).to eq(:very_high)
    end

  end

end
