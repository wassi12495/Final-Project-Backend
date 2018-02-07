class CurrentWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :routine

  has_many :exercises, foreign_key: "current_workout_id", class_name:"CurrentWorkoutExercise"
end
