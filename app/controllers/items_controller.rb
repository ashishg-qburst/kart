class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    @item = @cart.add_product(params[:product_id])
    if @item.save
      flash[:success] = "Added Item"
    else
      flash[:danger] = "Could not create item"
    end
    redirect_to root_path
  end
  
  private
      def item_params
        params.require(:item).permit(:product_id)
      end
end
