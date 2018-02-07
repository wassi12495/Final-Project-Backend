class Exercise < ApplicationRecord
  belongs_to :exercise_category

  has_many :routine_exercises
  has_many :routines, through: :routine_exercises

  has_many :current_workout_exercises
end
