class CreateCurrentWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :current_workout_exercises do |t|
      t.belongs_to :current_workout, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.string :measure
      t.string :name
      t.integer :sets
      t.integer :reps, default: [], array: true
      t.integer :measure_input, default: [], array: true

      t.timestamps
    end
  end
end
