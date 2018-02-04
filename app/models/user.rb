class User < ApplicationRecord
  has_secure_password

  has_many :routines
  has_many :exercises, through: :routines
  # has_many :workouts
  # has_many :exercises, through: :workouts

  validates :username, :password, :password_confirmation, presence: true
  validates :password, confirmation: true


end
