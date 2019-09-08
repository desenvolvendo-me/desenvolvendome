require 'rails_helper'

RSpec.describe "reclamacoes/show", type: :view do
  before(:each) do
    @reclamacao = assign(:reclamacao, Reclamacao.create!(
      :titulo => "Titulo",
      :descricao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/MyText/)
  end
end
