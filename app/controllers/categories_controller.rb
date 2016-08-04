class CategoriesController < ApplicationController

  def new
    @category = Category.new
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
    @products = Product.where(category_id: @category.id).page(params[:page]).per(8)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category Updated"
    else
      flash[:danger] = "Could not update category"
    end
    redirect_to root_path
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Category Deleted"
    else
      flash[:danger] = "Could not delete category"
    end
    redirect_to root_path
  end

    private
      def category_params
        params.require(:category).permit(:name,
          products_attributes: [:id, :name, :brand, :price, :_destroy,
            attachments_attributes: [:id, :product_id, :image, :_destroy]])
      end
end
