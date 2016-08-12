class AddColsToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :image_tmp, :string
    add_column :attachments, :image_processing, :boolean, null: false, default: false
  end
end
