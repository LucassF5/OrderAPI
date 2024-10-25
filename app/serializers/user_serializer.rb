class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone_number, :isLoja

  has_one :store
end
