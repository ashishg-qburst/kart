class Attachment < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader
  store_in_background :image
  belongs_to :product
end
