class AddSizeTypeToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :size_type, :integer
  end
end
