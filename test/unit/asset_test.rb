# == Schema Information
#
# Table name: assets
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :string(255)
#  vendor_sku_number :string(255)
#  status            :string(255)
#  mac_address       :string(255)
#  serial_number     :string(255)
#  quantity_in_stock :integer
#  quantiy_recieved  :integer
#  quantity_shipped  :integer
#  at_location_at    :date
#  decomissioned_at  :date
#  purchased_at      :date
#  intended_site     :string(255)
#  price             :decimal(, )
#  extended_price    :decimal(, )
#  rus_category      :string(255)
#  rus_subcategory   :string(255)
#  budget_line_item  :string(255)
#  contract          :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
