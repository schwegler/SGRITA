# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :string(255)
#  manufacturer :string(255)
#  sku_number   :string(255)
#  mfr_number   :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  attachment   :string(255)
#

class Product < ActiveRecord::Base
  	attr_accessible :remove_attachment, :attachment_cache, :attachment, :asset_attributes, :description, :manufacturer, :mfr_number, :name, :sku_number
  	mount_uploader :attachment, AttachmentUploader
	has_many :assets	
	accepts_nested_attributes_for :assets
end
