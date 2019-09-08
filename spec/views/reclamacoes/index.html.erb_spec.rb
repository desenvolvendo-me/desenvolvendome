require 'rails_helper'

RSpec.describe "reclamacoes/index", type: :view do
  before(:each) do
    assign(:reclamacoes, [
      Reclamacao.create!(
        :titulo => "Titulo",
        :descricao => "MyText"
      ),
      Reclamacao.create!(
        :titulo => "Titulo",
        :descricao => "MyText"
      )
    ])
  end

  it "renders a list of reclamacoes" do
    render
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
