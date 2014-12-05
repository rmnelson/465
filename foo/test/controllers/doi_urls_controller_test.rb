require 'test_helper'

class DoiUrlsControllerTest < ActionController::TestCase
  setup do
    @doi_url = doi_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doi_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doi_url" do
    assert_difference('DoiUrl.count') do
      post :create, doi_url: { description: @doi_url.description, doi_id: @doi_url.doi_id, name: @doi_url.name, url: @doi_url.url }
    end

    assert_redirected_to doi_url_path(assigns(:doi_url))
  end

  test "should show doi_url" do
    get :show, id: @doi_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doi_url
    assert_response :success
  end

  test "should update doi_url" do
    patch :update, id: @doi_url, doi_url: { description: @doi_url.description, doi_id: @doi_url.doi_id, name: @doi_url.name, url: @doi_url.url }
    assert_redirected_to doi_url_path(assigns(:doi_url))
  end

  test "should destroy doi_url" do
    assert_difference('DoiUrl.count', -1) do
      delete :destroy, id: @doi_url
    end

    assert_redirected_to doi_urls_path
  end
end
