class AddProcessingToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :processing, :integer
  end
end
