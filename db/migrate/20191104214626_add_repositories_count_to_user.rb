class AddRepositoriesCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :repositories_count, :integer
  end
end
