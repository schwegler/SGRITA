class AddAttachmentToAutos < ActiveRecord::Migration
  def change
    add_column :autos, :attachment, :string
  end
end
