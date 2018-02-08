class CreateWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_exercises do |t|
      t.belongs_to :workout, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.string :name
      t.string :measure_input, default: [], array: true
      t.integer :reps, default: [], array: true
      t.integer :sets

      t.timestamps
    end
  end
end
