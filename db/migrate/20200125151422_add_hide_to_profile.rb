class AddHideToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :hide, :boolean
  end
end
