class StaticController < ApplicationController
  def home
    @categories = get_categories
    @products = Product.all
    @new_product = Product.new
    @attachment = @new_product.attachments.build
    @new_category = Category.new
  end

  def about
  end

  def contact
  end
end
