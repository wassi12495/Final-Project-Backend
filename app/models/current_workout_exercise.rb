class CurrentWorkoutExercise < ApplicationRecord
  belongs_to :current_workout
  belongs_to :exercise
end
