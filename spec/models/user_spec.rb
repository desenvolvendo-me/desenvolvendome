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

RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user, :with_repositories, :with_profile)
  end

  it "user" do
    expect(@user.name).to eq("Marco")
    expect(@user.login).to eq("marcodotcastro")
    expect(@user.office).to eq("fullstack")
    expect(@user.followers).to eq(0)
    expect(@user.following).to eq(0)

    expect(@user.repositories.count).to eq(2)
    repository = @user.repositories.last
    expect(repository.name).to eq("hello_world")

    technology = repository.technologies.first
    expect(technology.exercise).to eq(5500)
    expect(technology.language.description).to eq("Portugol")
  end

end
