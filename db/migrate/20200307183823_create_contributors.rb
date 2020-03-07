class CreateContributors < ActiveRecord::Migration[6.0]
  def change
    create_table :contributors do |t|
      t.string :login
      t.references :repository, null: false, foreign_key: true
      t.references :contribution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
