class AddUserIdToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_reference :workouts, :user, foreign_key: true, null: false
  end
end