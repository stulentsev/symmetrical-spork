require 'test_helper'

class StudentReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_report" do
    assert_difference('StudentReport.count') do
      post :create, :student_report => { }
    end

    assert_redirected_to student_report_path(assigns(:student_report))
  end

  test "should show student_report" do
    get :show, :id => student_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => student_reports(:one).id
    assert_response :success
  end

  test "should update student_report" do
    put :update, :id => student_reports(:one).id, :student_report => { }
    assert_redirected_to student_report_path(assigns(:student_report))
  end

  test "should destroy student_report" do
    assert_difference('StudentReport.count', -1) do
      delete :destroy, :id => student_reports(:one).id
    end

    assert_redirected_to student_reports_path
  end
end
