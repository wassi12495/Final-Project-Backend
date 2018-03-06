class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :exercise_category, :columns

  # belongs_to :workout


end
