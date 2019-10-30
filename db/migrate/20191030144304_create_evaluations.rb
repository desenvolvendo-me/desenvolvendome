class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :level
      t.integer :evaluation_type
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
