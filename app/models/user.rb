class User < ApplicationRecord
  has_secure_password

  has_many :routines
  has_many :exercises, through: :routines

  has_many :workouts
  has_one :current_workout
  # has_many :exercises, through: :workouts

  validates :username, :password, :password_confirmation, presence: true
  validates :password, confirmation: true


  private



end
