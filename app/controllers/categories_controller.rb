class CategoriesController < ApplicationController
  def show
    @categories = get_categories
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      flash[:success] = "Added Product"
    else
      flash[:danger] = "Could not create product"
    end
    redirect_to root_path
  end

    private
      def category_params
        params.require(:category).permit(:name)
      end
end
