class CategoriesController < ApplicationController
  def show
    @categories = get_categories
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end
end
