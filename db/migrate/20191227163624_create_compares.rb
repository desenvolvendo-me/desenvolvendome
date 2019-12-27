class CreateCompares < ActiveRecord::Migration[6.0]
  def change
    create_table :compares do |t|
      t.integer :comparations_count
      t.integer :user_id
      t.integer :compared_id

      t.timestamps
    end
  end
end
