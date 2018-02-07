class CurrentWorkoutSerializer < ActiveModel::Serializer
  attributes :id, :current_workout_exercises
  has_one :user
  has_one :routine
end
