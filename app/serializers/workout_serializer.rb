class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :duration, :created_at
  #
  # belongs_to :user
  # has_many :exercises

end
