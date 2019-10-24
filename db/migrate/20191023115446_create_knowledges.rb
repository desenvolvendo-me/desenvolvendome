class CreateKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledges do |t|
      t.float :exercise
      t.references :language
      t.references :repository

      t.timestamps
    end
  end
end
