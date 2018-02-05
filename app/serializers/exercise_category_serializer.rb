class ExerciseCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :time_measurements, :time_units, :length_measurements, :length_units, :mass_measurements, :mass_units


end
