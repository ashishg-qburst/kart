class StaticController < ApplicationController
  def home
    @categories = get_categories
    @products = Product.all
    @new_product = Product.new
  end

  def about
  end

  def contact
  end
end
