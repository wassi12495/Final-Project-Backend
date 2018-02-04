class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :exercise_category

  # belongs_to :workout


end
