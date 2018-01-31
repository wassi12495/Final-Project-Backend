class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :first_name, :last_name, :is_trainer, :weight
end
