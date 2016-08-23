class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :authenticate, :check_if_admin, only: [:create]

  def index
    categories = Category.all
    render json: categories, each_serializer: Api::V1::CategorySerializer
  end

  def show
    category = Category.find_by_id(params[:id])
    if category
      render(json: category)
    else
      head status: :not_found
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      render(json: category)
    else
      head status: :internal_server_error
    end
  end

  private
  def category_params
    params.require(:category).permit(:name,
      products_attributes: [:id, :name, :brand, :price, :_destroy,
        attachments_attributes: [:id, :product_id, :image, :_destroy]])
  end
end