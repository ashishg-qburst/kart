class Product < ActiveRecord::Base
  has_many :reviews
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true

  belongs_to :category
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  
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
  
end
