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
#

class Product < ActiveRecord::Base
  	attr_accessible :asset_attributes, :description, :manufacturer, :mfr_number, :name, :sku_number
	has_many :assets	
	accepts_nested_attributes_for :assets
end
