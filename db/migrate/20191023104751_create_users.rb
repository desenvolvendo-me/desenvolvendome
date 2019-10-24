class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :github_id
      t.string :login
      t.string :bio
      t.string :name
      t.string :avatar
      t.integer :followers
      t.integer :following


      t.timestamps
    end
  end
end
