class AddVendorIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :vendor_id, :integer
  end
end
