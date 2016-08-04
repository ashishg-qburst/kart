module CurrentCart
  extend ActiveSupport::Concern

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
      @cart_items = @cart.items.all
      @cart_products = Array.new
      @cart_items.each do |i|
        @cart_products.push(i.product.id)
      end
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
end