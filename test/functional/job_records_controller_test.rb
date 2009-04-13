require 'test_helper'

class JobRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_record" do
    assert_difference('JobRecord.count') do
      post :create, :job_record => { }
    end

    assert_redirected_to job_record_path(assigns(:job_record))
  end

  test "should show job_record" do
    get :show, :id => job_records(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => job_records(:one).id
    assert_response :success
  end

  test "should update job_record" do
    put :update, :id => job_records(:one).id, :job_record => { }
    assert_redirected_to job_record_path(assigns(:job_record))
  end

  test "should destroy job_record" do
    assert_difference('JobRecord.count', -1) do
      delete :destroy, :id => job_records(:one).id
    end

    assert_redirected_to job_records_path
  end
end
