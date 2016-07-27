class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    product = Product.find(params[:product_id])
    @item = @cart.items.build(product: product)
    if @item.save
      flash[:success] = "Added Item"
    else
      flash[:danger] = "Could not create item"
    end
    redirect_to root_path
  end
end
