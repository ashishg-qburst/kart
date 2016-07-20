class ProductsController < ApplicationController
  def index
    @categories = get_categories
    @products = Product.all
  end

  def show
    @categories = get_categories
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id)
    @review = current_user.reviews.build
    @cart_action = @product.cart_action current_user.try :id
  end
end
