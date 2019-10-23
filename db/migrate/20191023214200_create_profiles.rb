class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.float :score
      t.references :user

      t.timestamps
    end
  end
end
