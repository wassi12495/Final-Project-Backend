class CreateExerciseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_categories do |t|
      t.string :name
      t.string :subject_of_measurement
      t.string :unit
      t.string :measure_of_duration


      t.timestamps
    end
  end
end
