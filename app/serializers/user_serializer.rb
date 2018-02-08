class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :is_trainer, :weight

  # has_many :workouts
  # has_many :exercises, through: :workouts
   # has_many :routines
end
