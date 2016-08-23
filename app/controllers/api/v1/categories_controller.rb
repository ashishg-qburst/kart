class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :authenticate, only: [:index]

  def index
    category = Category.find_by_id(params[:id])
    if category
      products = Product.where(category_id: params[:id])
      respond_with(category: category, products: products)
    else
      head status: :not_found
    end
  end
end