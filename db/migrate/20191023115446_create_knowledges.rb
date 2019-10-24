class CreateKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledges do |t|
      t.float :experience
      t.references :language
      t.references :profile

      t.timestamps
    end
  end
end
