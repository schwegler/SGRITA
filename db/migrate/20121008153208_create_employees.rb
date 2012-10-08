class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :work_phone
      t.string :home_phone
      t.string :mobile_phone
      t.string :address
      t.string :email
      t.string :title

      t.timestamps
    end
  end
end
