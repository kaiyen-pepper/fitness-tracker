class MakeUserIdNotNullInWorkouts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :workouts, :user_id, false
  end
end
