class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.boolean :is_cardio, default: false
      t.boolean :is_weights, default: false
      t.integer :weight
      t.integer :sets
      t.integer :reps
      t.integer :distance
      t.integer :duration
      t.string :measure
      t.belongs_to :workout

      t.timestamps
    end
  end
end
