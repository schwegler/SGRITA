# == Schema Information
#
# Table name: rus_pos
#
#  id                 :integer          not null, primary key
#  delivery_cost      :decimal(, )
#  sales_tax          :decimal(, )
#  total_cost         :decimal(, )
#  terms              :string(255)
#  ships_to           :text
#  RUS_project_number :string(255)
#  title              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RusPo < ActiveRecord::Base
  attr_accessible :RUS_project_number, :delivery_cost, :sales_tax, :ships_to, :terms, :title, :total_cost
end
