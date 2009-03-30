require 'test_helper'

class TrimestersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trimesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trimester" do
    assert_difference('Trimester.count') do
      post :create, :trimester => { }
    end

    assert_redirected_to trimester_path(assigns(:trimester))
  end

  test "should show trimester" do
    get :show, :id => trimesters(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trimesters(:one).id
    assert_response :success
  end

  test "should update trimester" do
    put :update, :id => trimesters(:one).id, :trimester => { }
    assert_redirected_to trimester_path(assigns(:trimester))
  end

  test "should destroy trimester" do
    assert_difference('Trimester.count', -1) do
      delete :destroy, :id => trimesters(:one).id
    end

    assert_redirected_to trimesters_path
  end
end
