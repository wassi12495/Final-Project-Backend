class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :time_of_workout

  belongs_to :user
  belongs_to :routine

end
