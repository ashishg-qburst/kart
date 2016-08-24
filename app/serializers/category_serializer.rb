class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :products

  link :self do
    api_v1_category_path(object)
  end
end
