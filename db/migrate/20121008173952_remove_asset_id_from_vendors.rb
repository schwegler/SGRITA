class RemoveAssetIdFromVendors < ActiveRecord::Migration
  def up
    remove_column :vendors, :asset_id
  end

  def down
    add_column :vendors, :asset_id, :integer
  end
end
