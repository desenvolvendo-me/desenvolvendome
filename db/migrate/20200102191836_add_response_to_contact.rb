class AddResponseToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :response, :string
  end
end
