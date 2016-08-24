class ProductSerializer < ActiveModel::Serializer
  attributes :name, :brand, :price, :description
  has_one :category
  link :self do
    href product_url(object)
  end
end