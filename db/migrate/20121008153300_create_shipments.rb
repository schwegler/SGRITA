class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :carrier
      t.string :tracking_number
      t.string :tracking_url
      t.string :shiping_via
      t.date :shipping_at
      t.date :on_schedule_at
      t.date :shipped_at
      t.date :delivered_at

      t.timestamps
    end
  end
end
