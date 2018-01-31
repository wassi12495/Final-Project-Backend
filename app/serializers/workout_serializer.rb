class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :duration

  belongs_to :user
  has_many :exercises

end
