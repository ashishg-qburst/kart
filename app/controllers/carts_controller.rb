class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]
  before_action :authenticate_user!
  
  def show
    @cart = Cart.find(session[:cart_id])
    @order = Order.new
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    flash[:success] = "Cart Empty"
    redirect_to root_path
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end