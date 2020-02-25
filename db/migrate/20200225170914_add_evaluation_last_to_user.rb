class AddEvaluationLastToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :evaluation_last, :datetime
  end
end
