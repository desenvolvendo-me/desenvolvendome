class SetEvaluationLast < ActiveRecord::Migration[6.0]
  def change
    User.all.update_all(evaluation_last: DateTime.now)
  end
end
