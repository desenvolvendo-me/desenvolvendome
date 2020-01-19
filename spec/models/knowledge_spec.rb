# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  contact_type :integer
#  description  :text
#  email        :string
#  name         :string
#  response     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Knowledge, type: :model do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  context "calc_language_ratiry" do

    it 'rarity 91' do
      percente = 91
      rarity = nil

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

      expect(rarity).to eq(:very_low)
    end

    it 'rarity 71' do
      percente = 71
      rarity = nil

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

      expect(rarity).to eq(:low)
    end

    it 'rarity 45' do
      percente = 45
      rarity = nil

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

      expect(rarity).to eq(:medium)
    end

    it 'rarity 45' do
      percente = 45
      rarity = nil

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

      expect(rarity).to eq(:medium)
    end

    it 'rarity 12' do
      percente = 12
      rarity = nil

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

      expect(rarity).to eq(:high)
    end

    it 'rarity 1' do
      percente = 1
      rarity = nil

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

      expect(rarity).to eq(:very_high)
    end

  end

end