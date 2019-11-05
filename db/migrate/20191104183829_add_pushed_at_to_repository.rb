class AddPushedAtToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :pushed_at, :date
  end
end
