class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :time_of_workout
      t.belongs_to :routine, foreign_key: true, optional: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
