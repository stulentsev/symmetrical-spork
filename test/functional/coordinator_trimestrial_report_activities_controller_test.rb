require 'test_helper'

class CoordinatorTrimestrialReportActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coordinator_trimestrial_report_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coordinator_trimestrial_report_activity" do
    assert_difference('CoordinatorTrimestrialReportActivity.count') do
      post :create, :coordinator_trimestrial_report_activity => { }
    end

    assert_redirected_to coordinator_trimestrial_report_activity_path(assigns(:coordinator_trimestrial_report_activity))
  end

  test "should show coordinator_trimestrial_report_activity" do
    get :show, :id => coordinator_trimestrial_report_activities(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coordinator_trimestrial_report_activities(:one).id
    assert_response :success
  end

  test "should update coordinator_trimestrial_report_activity" do
    put :update, :id => coordinator_trimestrial_report_activities(:one).id, :coordinator_trimestrial_report_activity => { }
    assert_redirected_to coordinator_trimestrial_report_activity_path(assigns(:coordinator_trimestrial_report_activity))
  end

  test "should destroy coordinator_trimestrial_report_activity" do
    assert_difference('CoordinatorTrimestrialReportActivity.count', -1) do
      delete :destroy, :id => coordinator_trimestrial_report_activities(:one).id
    end

    assert_redirected_to coordinator_trimestrial_report_activities_path
  end
end
