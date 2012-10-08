class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :fleet_number

      t.timestamps
    end
  end
end
