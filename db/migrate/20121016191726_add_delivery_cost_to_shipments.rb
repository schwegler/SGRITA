class AddDeliveryCostToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :delivery_cost, :decimal
  end
end
