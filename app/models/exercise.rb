class Exercise < ApplicationRecord
  belongs_to :exercise_category
  belongs_to :user, optional: true

  has_many :routine_exercises
  has_many :routines, through: :routine_exercises

  has_many :current_workout_exercises

  has_many :workout_exercises


  # Validations

  validates :name, presence: true
end
