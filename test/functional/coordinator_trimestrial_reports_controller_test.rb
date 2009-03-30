require 'test_helper'

class CoordinatorTrimestrialReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coordinator_trimestrial_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coordinator_trimestrial_report" do
    assert_difference('CoordinatorTrimestrialReport.count') do
      post :create, :coordinator_trimestrial_report => { }
    end

    assert_redirected_to coordinator_trimestrial_report_path(assigns(:coordinator_trimestrial_report))
  end

  test "should show coordinator_trimestrial_report" do
    get :show, :id => coordinator_trimestrial_reports(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coordinator_trimestrial_reports(:one).id
    assert_response :success
  end

  test "should update coordinator_trimestrial_report" do
    put :update, :id => coordinator_trimestrial_reports(:one).id, :coordinator_trimestrial_report => { }
    assert_redirected_to coordinator_trimestrial_report_path(assigns(:coordinator_trimestrial_report))
  end

  test "should destroy coordinator_trimestrial_report" do
    assert_difference('CoordinatorTrimestrialReport.count', -1) do
      delete :destroy, :id => coordinator_trimestrial_reports(:one).id
    end

    assert_redirected_to coordinator_trimestrial_reports_path
  end
end
