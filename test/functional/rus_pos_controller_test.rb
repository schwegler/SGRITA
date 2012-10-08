require 'test_helper'

class RusPosControllerTest < ActionController::TestCase
  setup do
    @rus_po = rus_pos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rus_pos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rus_po" do
    assert_difference('RusPo.count') do
      post :create, rus_po: { RUS_project_number: @rus_po.RUS_project_number, delivery_cost: @rus_po.delivery_cost, sales_tax: @rus_po.sales_tax, ships_to: @rus_po.ships_to, terms: @rus_po.terms, title: @rus_po.title, total_cost: @rus_po.total_cost }
    end

    assert_redirected_to rus_po_path(assigns(:rus_po))
  end

  test "should show rus_po" do
    get :show, id: @rus_po
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rus_po
    assert_response :success
  end

  test "should update rus_po" do
    put :update, id: @rus_po, rus_po: { RUS_project_number: @rus_po.RUS_project_number, delivery_cost: @rus_po.delivery_cost, sales_tax: @rus_po.sales_tax, ships_to: @rus_po.ships_to, terms: @rus_po.terms, title: @rus_po.title, total_cost: @rus_po.total_cost }
    assert_redirected_to rus_po_path(assigns(:rus_po))
  end

  test "should destroy rus_po" do
    assert_difference('RusPo.count', -1) do
      delete :destroy, id: @rus_po
    end

    assert_redirected_to rus_pos_path
  end
end
