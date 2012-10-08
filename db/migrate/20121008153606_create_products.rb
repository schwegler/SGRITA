class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :manufacturer
      t.string :sku_number
      t.string :mfr_number

      t.timestamps
    end
  end
end
