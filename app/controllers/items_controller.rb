class ItemsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @item = @cart.add_product(product.id, params.has_key?(:item) ? params[:item][:quantity] : 1)
    if @item.save
      flash.now[:success] = "Added Item"
    else
      flash.now[:danger] = "Could not create item"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    cart_item = Item.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  private
      def item_params
        params.require(:item).permit(:product_id, item: [:quantity])
      end
end
