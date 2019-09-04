require 'rails_helper'

RSpec.describe "reclamacoes/new", type: :view do
  before(:each) do
    assign(:reclamacao, Reclamacao.new(
      :titulo => "MyString",
      :descricao => "MyText"
    ))
  end

  it "renders new reclamacao form" do
    render

    assert_select "form[action=?][method=?]", reclamacoes_path, "post" do

      assert_select "input[name=?]", "reclamacao[titulo]"

      assert_select "textarea[name=?]", "reclamacao[descricao]"
    end
  end
end
