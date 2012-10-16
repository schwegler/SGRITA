class AddRusPoIdToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :rus_po_id, :integer
  end
end
