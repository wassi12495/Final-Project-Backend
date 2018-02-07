class CurrentWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :routine

  has_many :current_workout_exercises
end
