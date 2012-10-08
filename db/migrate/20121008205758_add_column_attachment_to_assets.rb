class AddColumnAttachmentToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :attachment, :string
  end
end
