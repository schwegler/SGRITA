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
#  rus_po_id       :integer
#  delivery_cost   :decimal(, )
#

require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
