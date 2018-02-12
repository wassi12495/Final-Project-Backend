class User < ApplicationRecord
  has_secure_password


  has_many :clients, class_name: "User", foreign_key: "trainer_id"
  belongs_to :trainer, class_name: "User", optional: true


  has_many :routines
  has_many :exercises, through: :routines

  has_many :workouts
  has_one :current_workout

  has_many :add_client_requests, foreign_key: "trainer_id"
  # has_many :add_client_requests, foreign_key: "client_id"

  # has_many :exercises, through: :workouts

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: true
  validates :password, confirmation: true



  private



end
