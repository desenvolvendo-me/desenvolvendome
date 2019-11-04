class AddEvaluationsCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :evaluations_count, :integer
  end
end
