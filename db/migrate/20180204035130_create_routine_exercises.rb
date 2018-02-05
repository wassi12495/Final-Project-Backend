class CreateRoutineExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :routine_exercises do |t|
      t.belongs_to :routine, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.string :name
      t.string :description
      t.integer :sets
      t.integer :reps, default:[], array: true
      t.text :measure
      t.timestamps
    end
  end
end
