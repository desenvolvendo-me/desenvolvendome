# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  bio                    :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  evaluations_count      :integer
#  followers              :integer
#  following              :integer
#  login                  :string
#  name                   :string
#  office                 :integer
#  provider               :string
#  remember_created_at    :datetime
#  repositories_count     :integer
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  github_id              :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe "Dashboard" do

  it "users_50" do
    users_50_visits_most = [["marcodotcastro", 1], ["phalmeida", 1], ["NickolasDev", 1], ["leonnleite", 1], ["pvm", 1], ["MoacirPetry", 1], ["andradee1", 3], ["desenvolvendome", 3]]
    users_50_evaluations_most = [["desenvolvendome", 6], ["marcodotcastro", 5]]
    users_50 = []
    users_50_visits_most.each do |vm50|
      commom = users_50_evaluations_most.detect {|e| e.first == vm50.first}
      users_50.push([vm50.first, commom ? vm50.last * commom.last : vm50.last])
    end

    responde = [["marcodotcastro", 5], ["phalmeida", 1], ["NickolasDev", 1], ["leonnleite", 1], ["pvm", 1], ["MoacirPetry", 1], ["andradee1", 3], ["desenvolvendome", 18]]

    expect(users_50).to eq(responde)
  end

end
