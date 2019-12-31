class RemoveFriendlyId < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :slug
    drop_table :friendly_id_slugs
  end
end
