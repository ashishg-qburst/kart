class ProductsController < ApplicationController
  def index
    @categories = get_categories
    if params[:search]
      @products = Product.search(params[:search]).page(params[:page]).per(10)
    else
      @products = Product.page(params[:page]).per(10)
    end
  end

  def show
    @categories = get_categories
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id)
    @review = current_user.reviews.build if current_user
    @item = @cart.items.find_by(product_id: @product.id)
    @item ||= Item.new
  end

  def create
    @new_product = Product.new(product_params)
    cat = Category.find(params[:categories][:name])
    @new_product.category_id = cat.id
    if @new_product.save
      flash[:success] = "Added Product"
    else
      flash[:danger] = "Could not create product"
    end
    redirect_to root_path
  end

  def edit
    @categories = get_categories
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    cat = Category.find(params[:categories][:name])
    @product.category_id = cat.id
    if @product.update_attributes(product_params)
      flash[:success] = "Product Updated"
    else
      flash[:danger] = "Could not update product"
    end
    redirect_to root_path
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = "Product Deleted"
    else
      flash[:danger] = "Could not delete product"
    end
    redirect_to root_path
  end

  private
      def product_params
        params.require(:product).permit(:name, :brand, :price, :image)
      end
end
