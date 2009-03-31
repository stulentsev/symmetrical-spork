require 'test_helper'

class StudentPerformancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_performance" do
    assert_difference('StudentPerformance.count') do
      post :create, :student_performance => { }
    end

    assert_redirected_to student_performance_path(assigns(:student_performance))
  end

  test "should show student_performance" do
    get :show, :id => student_performances(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => student_performances(:one).id
    assert_response :success
  end

  test "should update student_performance" do
    put :update, :id => student_performances(:one).id, :student_performance => { }
    assert_redirected_to student_performance_path(assigns(:student_performance))
  end

  test "should destroy student_performance" do
    assert_difference('StudentPerformance.count', -1) do
      delete :destroy, :id => student_performances(:one).id
    end

    assert_redirected_to student_performances_path
  end
end
