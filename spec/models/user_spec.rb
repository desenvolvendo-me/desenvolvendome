# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  bio        :string
#  followers  :integer
#  following  :integer
#  login      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = create(:user)
  end

  it "create" do
    expect(@user.name).to eq("Marco Castro")
    expect(@user.login).to eq("marcodotcastro")
  end

end
