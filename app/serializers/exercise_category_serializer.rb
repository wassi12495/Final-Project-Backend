class ExerciseCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :subject_of_measurement, :unit, :measure_of_duration


end
