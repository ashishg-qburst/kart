class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :products

  class ProductSerializer < ActiveModel::Serializer
    attributes :name, :brand, :price
    link :self do
      href product_url(object)
    end
  end

  link :self do
    api_v1_category_url(object)
  end
end
