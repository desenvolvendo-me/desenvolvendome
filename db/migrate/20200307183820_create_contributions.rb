class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.datetime :period
      t.integer :additions
      t.integer :deletions
      t.integer :commits

      t.timestamps
    end
  end
end
