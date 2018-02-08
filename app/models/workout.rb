class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :routine, optional: true

  has_many :exercises, foreign_key: "workout_id", class_name:"WorkoutExercise"

end
