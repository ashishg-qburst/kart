class ItemsController < ApplicationController
  def create
    @item = @cart.add_product(params[:product_id],
      (params.has_key?(:item) && params[:item][:quantity].to_i > 0) ? params[:item][:quantity] : 1)
    if @item.save
      flash.now[:success] = "Added Item"
    else
      flash.now[:danger] = "Could not add item to cart"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @product = Product.find(@item.product_id)
    @item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private
      def item_params
        params.require(:item).permit(:product_id, :quantity)
      end
end
