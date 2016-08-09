class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.add_items_from_cart(@cart)
    @order.user_id = current_user.id

    if !@order.items.empty? && @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:success] = "Order Placed"
      redirect_to root_url
    else
      flash[:danger] = "Could not place order"
      redirect_to request.referer
    end
  end

  private
    def order_params
      params.require(:order).permit(:id, :name, :address, :pin)
    end
end
