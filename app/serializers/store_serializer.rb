class StoreSerializer < ActiveModel::Serializer
  attributes :id, :cnpj, :uf, :cep, :razao_social, :nome_fantasia, :user_id

  has_many :categories
  has_many :products
  
  belongs_to :user
end