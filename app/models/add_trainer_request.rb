class AddTrainerRequest < ApplicationRecord
  belongs_to :trainer, class_name: "User", foreign_key: "trainer_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id"
end
