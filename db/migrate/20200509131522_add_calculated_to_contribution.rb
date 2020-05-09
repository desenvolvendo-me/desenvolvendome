class AddCalculatedToContribution < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :calculated, :boolean
  end
end
