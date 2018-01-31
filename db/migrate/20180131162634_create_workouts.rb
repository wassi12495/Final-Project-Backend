class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.integer :duration

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
