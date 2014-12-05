require 'test_helper'

class AclsControllerTest < ActionController::TestCase
  setup do
    @acl = acls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acl" do
    assert_difference('Acl.count') do
      post :create, acl: { image_id: @acl.image_id, user_id: @acl.user_id }
    end

    assert_redirected_to acl_path(assigns(:acl))
  end

  test "should show acl" do
    get :show, id: @acl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acl
    assert_response :success
  end

  test "should update acl" do
    patch :update, id: @acl, acl: { image_id: @acl.image_id, user_id: @acl.user_id }
    assert_redirected_to acl_path(assigns(:acl))
  end

  test "should destroy acl" do
    assert_difference('Acl.count', -1) do
      delete :destroy, id: @acl
    end

    assert_redirected_to acls_path
  end
end
