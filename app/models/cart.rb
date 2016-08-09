class Cart < ActiveRecord::Base
  include ItemOps
  
  has_many :items, dependent: :destroy

  def add_product(product_id, quant)
    current_item = items.find_by(product_id: product_id)
    current_item = items.build(product_id: product_id, quantity: quant)
  end
end