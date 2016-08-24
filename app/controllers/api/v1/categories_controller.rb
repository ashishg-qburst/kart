class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :authenticate, :check_if_admin, only: [:create, :update, :destroy]

  def index
    categories = Category.all
    render json: categories, each_serializer: Api::V1::CategorySerializer
  end

  def show
    category = Category.find_by_id(params[:id])
    if category
      render(json: Api::V1::CategorySerializer.new(category))
    else
      head status: :not_found
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      render(json: Api::V1::CategorySerializer.new(category), status: :created)
    else
      head status: :internal_server_error
    end
  end

  def edit
    category = Category.find(params[:id])
    if category
      render(json: Api::V1::CategorySerializer.new(category), status: :ok)
    else
      head status: :not_found
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update_attributes(category_params)
      render(json: Api::V1::CategorySerializer.new(category), status: :ok)
    else
      head status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name,
      products_attributes: [:id, :name, :brand, :price, :_destroy,
        attachments_attributes: [:id, :product_id, :image, :_destroy]])
  end
end