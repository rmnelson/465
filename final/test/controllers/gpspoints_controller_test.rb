require 'test_helper'

class GpspointsControllerTest < ActionController::TestCase
  setup do
    @gpspoint = gpspoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpspoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpspoint" do
    assert_difference('Gpspoint.count') do
      post :create, gpspoint: { altitude: @gpspoint.altitude, angle: @gpspoint.angle, date: @gpspoint.date, hdofp: @gpspoint.hdofp, hofgae: @gpspoint.hofgae, latitude: @gpspoint.latitude, longitude: @gpspoint.longitude, num_sats: @gpspoint.num_sats, speed_km: @gpspoint.speed_km, speed_mph: @gpspoint.speed_mph, time: @gpspoint.time }
    end

    assert_redirected_to gpspoint_path(assigns(:gpspoint))
  end

  test "should show gpspoint" do
    get :show, id: @gpspoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpspoint
    assert_response :success
  end

  test "should update gpspoint" do
    patch :update, id: @gpspoint, gpspoint: { altitude: @gpspoint.altitude, angle: @gpspoint.angle, date: @gpspoint.date, hdofp: @gpspoint.hdofp, hofgae: @gpspoint.hofgae, latitude: @gpspoint.latitude, longitude: @gpspoint.longitude, num_sats: @gpspoint.num_sats, speed_km: @gpspoint.speed_km, speed_mph: @gpspoint.speed_mph, time: @gpspoint.time }
    assert_redirected_to gpspoint_path(assigns(:gpspoint))
  end

  test "should destroy gpspoint" do
    assert_difference('Gpspoint.count', -1) do
      delete :destroy, id: @gpspoint
    end

    assert_redirected_to gpspoints_path
  end
end
