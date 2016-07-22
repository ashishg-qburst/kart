class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @categories = get_categories
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
    @order = Order.new
  end

  def add
    $redis.sadd current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

  def buy
    $redis.sadd current_user_cart, params[:product_id]
    redirect_to carts_show_path
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end