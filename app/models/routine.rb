class Routine < ApplicationRecord

  belongs_to :user, optional: true

  # Routine - Exercise associations
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises

  # Routine - Workout associations
  has_many :workouts

  # Routine - CurrentWorkout association
  has_many :current_workouts

  #Validations
  validates :title, presence: true




  def getExercises
    myExercises = exercises.map{|e| e}
    return myExercises
  end


end
