class AddPrincipalTechnologyToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :principal_technology, :string
  end
end
