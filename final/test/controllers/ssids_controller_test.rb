require 'test_helper'

class SsidsControllerTest < ActionController::TestCase
  setup do
    @ssid = ssids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssid" do
    assert_difference('Ssid.count') do
      post :create, ssid: { auth: @ssid.auth, bssid: @ssid.bssid, channel: @ssid.channel, encryption: @ssid.encryption, high_rssi: @ssid.high_rssi, high_signal: @ssid.high_signal, label: @ssid.label, manufacture: @ssid.manufacture, net_type: @ssid.net_type, public: @ssid.public, radio_type: @ssid.radio_type, sec_type: @ssid.sec_type, special_transfer_rates: @ssid.special_transfer_rates, ssid: @ssid.ssid, transfer_rates: @ssid.transfer_rates, user_id: @ssid.user_id }
    end

    assert_redirected_to ssid_path(assigns(:ssid))
  end

  test "should show ssid" do
    get :show, id: @ssid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ssid
    assert_response :success
  end

  test "should update ssid" do
    patch :update, id: @ssid, ssid: { auth: @ssid.auth, bssid: @ssid.bssid, channel: @ssid.channel, encryption: @ssid.encryption, high_rssi: @ssid.high_rssi, high_signal: @ssid.high_signal, label: @ssid.label, manufacture: @ssid.manufacture, net_type: @ssid.net_type, public: @ssid.public, radio_type: @ssid.radio_type, sec_type: @ssid.sec_type, special_transfer_rates: @ssid.special_transfer_rates, ssid: @ssid.ssid, transfer_rates: @ssid.transfer_rates, user_id: @ssid.user_id }
    assert_redirected_to ssid_path(assigns(:ssid))
  end

  test "should destroy ssid" do
    assert_difference('Ssid.count', -1) do
      delete :destroy, id: @ssid
    end

    assert_redirected_to ssids_path
  end
end
