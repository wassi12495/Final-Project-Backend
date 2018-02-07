class CurrentWorkoutSerializer < ActiveModel::Serializer
  attributes :id, :exercises
  has_one :user
  has_one :routine
end
