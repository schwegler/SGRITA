class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
