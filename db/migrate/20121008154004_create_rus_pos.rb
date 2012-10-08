class CreateRusPos < ActiveRecord::Migration
  def change
    create_table :rus_pos do |t|
      t.decimal :delivery_cost
      t.decimal :sales_tax
      t.decimal :total_cost
      t.string :terms
      t.text :ships_to
      t.string :RUS_project_number
      t.string :title

      t.timestamps
    end
  end
end
