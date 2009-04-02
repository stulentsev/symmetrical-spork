require 'test_helper'

class EducatorReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educator_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create educator_report" do
    assert_difference('EducatorReport.count') do
      post :create, :educator_report => { }
    end

    assert_redirected_to educator_report_path(assigns(:educator_report))
  end

  test "should show educator_report" do
    get :show, :id => educator_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => educator_reports(:one).id
    assert_response :success
  end

  test "should update educator_report" do
    put :update, :id => educator_reports(:one).id, :educator_report => { }
    assert_redirected_to educator_report_path(assigns(:educator_report))
  end

  test "should destroy educator_report" do
    assert_difference('EducatorReport.count', -1) do
      delete :destroy, :id => educator_reports(:one).id
    end

    assert_redirected_to educator_reports_path
  end
end
