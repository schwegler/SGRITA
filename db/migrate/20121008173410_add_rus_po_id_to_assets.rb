class AddRusPoIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :rus_po_id, :integer
  end
end
