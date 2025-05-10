class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.string :workout_type
      t.integer :duration
      t.integer :reps
      t.text :notes
      t.date :date

      t.timestamps
    end
  end
end
