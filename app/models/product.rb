class Product < ActiveRecord::Base
  has_many :reviews
  has_many :items
  before_destroy :ensure_not_referenced_by_any_item
  belongs_to :category
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true

  mount_uploader :image, ProductImageUploader
  
  ratyrate_rateable "product"

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

  def self.search(query)
    where("name LIKE ? OR brand LIKE ?", "%#{ query }%", "%#{ query }%")
  end

  private
    def ensure_not_referenced_by_any_item
      if items.empty?
        return true
      else
        return false
      end
    end
  
end
