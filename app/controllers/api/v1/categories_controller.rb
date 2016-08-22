class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    category = Category.find_by_id(params[:id])
    if category
      products = Product.where(category_id: params[:id])
      respond_with(products: products, category: category)
    else
      respond_with(error: "Category not found")
    end
  end
end