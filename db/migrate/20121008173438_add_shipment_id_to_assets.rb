class AddShipmentIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :shipment_id, :integer
  end
end
