class Attachment < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader
  belongs_to :product
end
