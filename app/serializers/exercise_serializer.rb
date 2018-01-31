class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :exercise_type, :weight, :sets, :reps, :distance, :duration, :measure

  belongs_to :workout


end
