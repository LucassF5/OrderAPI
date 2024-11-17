class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password, :phone_number, :isLoja

  has_one :store
end
