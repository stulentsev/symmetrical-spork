require 'test_helper'

class PartnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partners" do
    assert_difference('Partners.count') do
      post :create, :partners => { }
    end

    assert_redirected_to partners_path(assigns(:partners))
  end

  test "should show partners" do
    get :show, :id => partners(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => partners(:one).id
    assert_response :success
  end

  test "should update partners" do
    put :update, :id => partners(:one).id, :partners => { }
    assert_redirected_to partners_path(assigns(:partners))
  end

  test "should destroy partners" do
    assert_difference('Partners.count', -1) do
      delete :destroy, :id => partners(:one).id
    end

    assert_redirected_to partners_path
  end
end
