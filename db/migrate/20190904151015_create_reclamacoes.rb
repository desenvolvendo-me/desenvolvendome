class CreateReclamacoes < ActiveRecord::Migration[6.0]
  def change
    create_table :reclamacoes do |t|
      t.string :titulo
      t.text :descricao

      t.timestamps
    end
  end
end
