class CreateCurrentWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :current_workouts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :routine, foreign_key: true

      t.timestamps
    end
  end
end
