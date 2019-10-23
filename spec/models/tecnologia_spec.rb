# == Schema Information
#
# Table name: tecnologias
#
#  id          :bigint           not null, primary key
#  descricao   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Tecnologia, type: :model do

  before(:all) do
    @tecnologia = create(:tecnologia)
  end

  it "create" do
    expect(@tecnologia.descricao).to eq("Java")
  end

end
