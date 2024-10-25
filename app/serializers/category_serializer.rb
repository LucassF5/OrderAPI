class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  belongs_to :store
  has_many :products
end