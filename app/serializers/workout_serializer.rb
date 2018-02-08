class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :time_of_workout, :routine_id, :user_id, :exercises


end
