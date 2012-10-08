require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, asset: { at_location_at: @asset.at_location_at, budget_line_item: @asset.budget_line_item, contract: @asset.contract, decomissioned_at: @asset.decomissioned_at, description: @asset.description, extended_price: @asset.extended_price, intended_site: @asset.intended_site, mac_address: @asset.mac_address, name: @asset.name, price: @asset.price, purchased_at: @asset.purchased_at, quantity_in_stock: @asset.quantity_in_stock, quantity_shipped: @asset.quantity_shipped, quantiy_recieved: @asset.quantiy_recieved, rus_category: @asset.rus_category, rus_subcategory: @asset.rus_subcategory, serial_number: @asset.serial_number, status: @asset.status, vendor_sku_number: @asset.vendor_sku_number }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should show asset" do
    get :show, id: @asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset
    assert_response :success
  end

  test "should update asset" do
    put :update, id: @asset, asset: { at_location_at: @asset.at_location_at, budget_line_item: @asset.budget_line_item, contract: @asset.contract, decomissioned_at: @asset.decomissioned_at, description: @asset.description, extended_price: @asset.extended_price, intended_site: @asset.intended_site, mac_address: @asset.mac_address, name: @asset.name, price: @asset.price, purchased_at: @asset.purchased_at, quantity_in_stock: @asset.quantity_in_stock, quantity_shipped: @asset.quantity_shipped, quantiy_recieved: @asset.quantiy_recieved, rus_category: @asset.rus_category, rus_subcategory: @asset.rus_subcategory, serial_number: @asset.serial_number, status: @asset.status, vendor_sku_number: @asset.vendor_sku_number }
    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, id: @asset
    end

    assert_redirected_to assets_path
  end
end
