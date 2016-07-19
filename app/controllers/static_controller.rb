class StaticController < ApplicationController
  def home
    @categories = get_categories
    @products = Product.all
  end

  def about
  end

  def contact
  end
end
