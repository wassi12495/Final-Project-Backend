class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.string :exercise_category
      t.belongs_to :user, optional:true, foreign_key: true
      t.string :columns, default: [], array: true

      t.timestamps
    end
  end
end
