require 'rails_helper'

RSpec.describe "reclamacoes/edit", type: :view do
  before(:each) do
    @reclamacao = assign(:reclamacao, Reclamacao.create!(
      :titulo => "MyString",
      :descricao => "MyText"
    ))
  end

  it "renders the edit reclamacao form" do
    render

    assert_select "form[action=?][method=?]", reclamacao_path(@reclamacao), "post" do

      assert_select "input[name=?]", "reclamacao[titulo]"

      assert_select "textarea[name=?]", "reclamacao[descricao]"
    end
  end
end
