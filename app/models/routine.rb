class Routine < ApplicationRecord

  belongs_to :user

  # Routine - Exercise associations
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises

  # Routine - Workout associations
  has_many :workouts


  #Validations
  validates :title, presence: true




  def getExercises
    myExercises = exercises.map{|e| e}
    return myExercises
  end


end
