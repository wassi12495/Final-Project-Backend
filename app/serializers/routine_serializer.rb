class RoutineSerializer < ActiveModel::Serializer
  attributes :id, :title, :routine_exercises, :workouts
  has_one :user
  has_many :routine_exercises
  # has_many :exercises
end
