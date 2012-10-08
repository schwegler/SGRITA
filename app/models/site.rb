# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  number     :integer
#  gps        :string(255)
#  kind       :string(255)
#  city       :string(255)
#  county     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  attr_accessible :city, :county, :gps, :kind, :name, :number
  has_many :assets
end
