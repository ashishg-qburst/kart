class ProductSerializer < ActiveModel::Serializer
  attributes :name, :brand, :price
  has_one :category
  link :self do
    href product_path(object)
  end
end