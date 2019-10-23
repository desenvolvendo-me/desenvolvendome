class CreateTecnologias < ActiveRecord::Migration[6.0]
  def change
    create_table :tecnologias do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
