class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, :address, :pin, presence: true

  def add_items_from_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      items << item
    end
  end
end