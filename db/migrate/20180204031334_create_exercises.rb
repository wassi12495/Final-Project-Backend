class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.belongs_to :exercise_category

      t.timestamps
    end
  end
end
