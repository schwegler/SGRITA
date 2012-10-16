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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
