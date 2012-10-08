class AddAssetIdToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :asset_id, :integer
  end
end
