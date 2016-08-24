class Api::V1::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :products, serializer: Api::V1::ProductSerializer
end
