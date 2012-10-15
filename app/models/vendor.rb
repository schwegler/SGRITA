# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  phone      :string(255)
#  website    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vendor < ActiveRecord::Base
  	autocomplete :name
  	attr_accessible :address, :name, :phone, :website
	has_many :assets
end
