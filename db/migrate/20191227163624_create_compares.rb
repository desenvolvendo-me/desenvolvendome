class CreateCompares < ActiveRecord::Migration[6.0]
  def change
    create_table :compares do |t|
      t.integer :comparations_count
      t.integer :login
      t.integer :compared_id

      t.timestamps
    end
  end
end
