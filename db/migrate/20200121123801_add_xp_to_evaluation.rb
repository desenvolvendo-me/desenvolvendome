class AddXpToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :xp, :integer
  end
end
