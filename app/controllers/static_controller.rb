class StaticController < ApplicationController
  def home
    @categories = get_categories
    @products = Product.page(params[:page]).per(10)
    @new_product = Product.new
    @new_category = Category.new
  end

  def about
  end

  def contact
  end
end
