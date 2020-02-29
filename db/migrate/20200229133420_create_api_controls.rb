class CreateApiControls < ActiveRecord::Migration[6.0]
  def change
    create_table :api_controls do |t|
      t.string :key
      t.integer :limit
      t.integer :consume
      t.datetime :reset
      t.text :description

      t.timestamps
    end
  end
end
