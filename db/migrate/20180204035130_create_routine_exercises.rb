class CreateRoutineExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :routine_exercises do |t|
      t.belongs_to :routine, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.integer :sets 
      t.timestamps
    end
  end
end
