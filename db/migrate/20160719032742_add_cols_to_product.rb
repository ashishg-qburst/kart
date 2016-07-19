class AddColsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :units, :integer, null: false, default: 0
  end
end
