class CreateConhecimentos < ActiveRecord::Migration[6.0]
  def change
    create_table :conhecimentos do |t|
      t.float :experiencia
      t.references :tecnologia, null: false, foreign_key: true
      t.references :perfil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
