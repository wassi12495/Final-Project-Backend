class AddClientRequest < ApplicationRecord
  belongs_to :trainer, class_name: "User"
  belongs_to :client, class_name: "User"
end
