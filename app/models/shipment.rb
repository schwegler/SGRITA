# == Schema Information
#
# Table name: shipments
#
#  id              :integer          not null, primary key
#  carrier         :string(255)
#  tracking_number :string(255)
#  tracking_url    :string(255)
#  shiping_via     :string(255)
#  shipping_at     :date
#  on_schedule_at  :date
#  shipped_at      :date
#  delivered_at    :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Shipment < ActiveRecord::Base
  	attr_accessible :carrier, :delivered_at, :on_schedule_at, :shiping_via, :shipped_at, :shipping_at, :tracking_number, :tracking_url
  	scope :notdelivered, where(:delivered_at => nil)
	scope :notshipped, where(:shipped_at => nil)
end
