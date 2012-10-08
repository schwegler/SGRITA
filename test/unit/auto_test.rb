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

require 'test_helper'

class AutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
