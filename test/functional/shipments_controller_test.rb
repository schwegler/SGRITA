require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { carrier: @shipment.carrier, delivered_at: @shipment.delivered_at, on_schedule_at: @shipment.on_schedule_at, shiping_via: @shipment.shiping_via, shipped_at: @shipment.shipped_at, shipping_at: @shipment.shipping_at, tracking_number: @shipment.tracking_number, tracking_url: @shipment.tracking_url }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    put :update, id: @shipment, shipment: { carrier: @shipment.carrier, delivered_at: @shipment.delivered_at, on_schedule_at: @shipment.on_schedule_at, shiping_via: @shipment.shiping_via, shipped_at: @shipment.shipped_at, shipping_at: @shipment.shipping_at, tracking_number: @shipment.tracking_number, tracking_url: @shipment.tracking_url }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
