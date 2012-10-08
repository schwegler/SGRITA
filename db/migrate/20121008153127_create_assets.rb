class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.string :vendor_sku_number
      t.string :status
      t.string :mac_address
      t.string :serial_number
      t.integer :quantity_in_stock
      t.integer :quantiy_recieved
      t.integer :quantity_shipped
      t.date :at_location_at
      t.date :decomissioned_at
      t.date :purchased_at
      t.string :intended_site
      t.decimal :price
      t.decimal :extended_price
      t.string :rus_category
      t.string :rus_subcategory
      t.string :budget_line_item
      t.string :contract

      t.timestamps
    end
  end
end
