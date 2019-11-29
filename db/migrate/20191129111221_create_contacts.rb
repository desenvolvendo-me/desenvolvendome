class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :contact_type
      t.text :description

      t.timestamps
    end
  end
end
