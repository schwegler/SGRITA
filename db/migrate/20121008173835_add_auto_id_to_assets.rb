class AddAutoIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :auto_id, :integer
  end
end
