class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :product_id
      t.string :image

      t.timestamps null: false
    end
  end
end
