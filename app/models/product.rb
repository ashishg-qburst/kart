class Product < ActiveRecord::Base
  has_many :reviews

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true

  has_many :items
  before_destroy :ensure_not_referenced_by_any_item

  belongs_to :category
  
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  
  ratyrate_rateable "product"

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
