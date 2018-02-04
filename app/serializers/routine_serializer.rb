class RoutineSerializer < ActiveModel::Serializer
  attributes :id, :title, :exercises
  has_one :user
  # has_many :routine_exercises
  has_many :exercises
end
