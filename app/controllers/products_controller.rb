class ProductsController < ApplicationController
  def index
    @categories = get_categories
    @products = Product.all
  end

  def show
    @categories = get_categories
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id)
    @review = Review.new
  end
end
