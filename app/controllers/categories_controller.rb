class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  
  def new
    @category = Category.new
    @category.products.build
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      flash[:success] = "Added Category"
    else
      flash[:danger] = "Could not create category"
    end
    redirect_to root_path
  end

  def show
    @categories = get_categories
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

    private
      def category_params
        params.require(:category).permit(:name, products_attributes: [:name, :brand, :price, :image, :_destroy])
      end
end
