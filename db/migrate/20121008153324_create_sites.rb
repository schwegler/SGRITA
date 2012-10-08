class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :number
      t.string :gps
      t.string :kind
      t.string :city
      t.string :county

      t.timestamps
    end
  end
end
