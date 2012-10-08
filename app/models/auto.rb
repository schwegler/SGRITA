# == Schema Information
#
# Table name: autos
#
#  id           :integer          not null, primary key
#  make         :string(255)
#  model        :string(255)
#  year         :string(255)
#  fleet_number :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Auto < ActiveRecord::Base
  	attr_accessible :fleet_number, :make, :model, :year
	has_many :assets
end
