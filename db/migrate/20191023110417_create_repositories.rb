class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.integer :github_id
      t.string :name
      t.boolean :fork
      t.integer :size
      t.integer :forks_count
      t.integer :stargazers_count

      t.timestamps
    end
  end
end
