class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.add_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:success] = "Order Placed"
    else
      flash[:danger] = "Could not place order"
    end
    redirect_to root_path
  end

  private
    def order_params
      params.require(:order).permit(:id, :name, :address, :pin)
    end
end
