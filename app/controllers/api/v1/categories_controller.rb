class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :authenticate, :check_if_admin, only: [:create]

  def create
    category = Category.new(category_params)
    if category.save
      head status: :created
    else
      head status: :internal_server_error
    end
  end

  def index
    category = Category.find_by_id(params[:id])
    if category
      products = Product.where(category_id: params[:id])
      respond_with(category: category, products: products)
    else
      head status: :not_found
    end
  end

  private
    def category_params
      params.require(:category).permit(:name,
                                products_attributes: [:id, :name, :brand, :price, :_destroy,
                                attachments_attributes: [:id, :product_id, :image, :_destroy]])
    end
end