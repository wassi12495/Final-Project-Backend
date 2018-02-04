class CreateExerciseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_categories do |t|
      t.string :name
      t.text :time_measurements, array: true, default: []
      t.text :length_measurements, array: true, default: []
      t.text :mass_measurements, array: true, default: []
      t.text :time_units, array: true, default: []
      t.text :length_units, array: true, default: []
      t.text :mass_units, array: true, default: []

      t.timestamps
    end
  end
end
