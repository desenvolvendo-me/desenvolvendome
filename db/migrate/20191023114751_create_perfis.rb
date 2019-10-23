class CreatePerfis < ActiveRecord::Migration[6.0]
  def change
    create_table :perfis do |t|
      t.string :nome
      t.string :descricao
      t.string :github

      t.timestamps
    end
  end
end
