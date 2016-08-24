class Api::V1::ProductsController < Api::V1::BaseController
  def index
    products = Product.all
    render json: products, each_serializer: Api::V1::ProductSerializer
  end
end