require 'test_helper'

class PollpointsControllerTest < ActionController::TestCase
  setup do
    @pollpoint = pollpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pollpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pollpoint" do
    assert_difference('Pollpoint.count') do
      post :create, pollpoint: { gps_id: @pollpoint.gps_id, rssi: @pollpoint.rssi, signal: @pollpoint.signal, ssid_id: @pollpoint.ssid_id }
    end

    assert_redirected_to pollpoint_path(assigns(:pollpoint))
  end

  test "should show pollpoint" do
    get :show, id: @pollpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pollpoint
    assert_response :success
  end

  test "should update pollpoint" do
    patch :update, id: @pollpoint, pollpoint: { gps_id: @pollpoint.gps_id, rssi: @pollpoint.rssi, signal: @pollpoint.signal, ssid_id: @pollpoint.ssid_id }
    assert_redirected_to pollpoint_path(assigns(:pollpoint))
  end

  test "should destroy pollpoint" do
    assert_difference('Pollpoint.count', -1) do
      delete :destroy, id: @pollpoint
    end

    assert_redirected_to pollpoints_path
  end
end
