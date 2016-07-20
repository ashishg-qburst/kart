class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :category
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  
  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
