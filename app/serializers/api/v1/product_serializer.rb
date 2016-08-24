class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :category
end