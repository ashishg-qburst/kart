class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :price
  has_one :category, serializer: Api::V1::CategorySerializer
end