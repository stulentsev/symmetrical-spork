require 'test_helper'

class CourseStudentProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_student_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_student_profile" do
    assert_difference('CourseStudentProfile.count') do
      post :create, :course_student_profile => { }
    end

    assert_redirected_to course_student_profile_path(assigns(:course_student_profile))
  end

  test "should show course_student_profile" do
    get :show, :id => course_student_profiles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => course_student_profiles(:one).id
    assert_response :success
  end

  test "should update course_student_profile" do
    put :update, :id => course_student_profiles(:one).id, :course_student_profile => { }
    assert_redirected_to course_student_profile_path(assigns(:course_student_profile))
  end

  test "should destroy course_student_profile" do
    assert_difference('CourseStudentProfile.count', -1) do
      delete :destroy, :id => course_student_profiles(:one).id
    end

    assert_redirected_to course_student_profiles_path
  end
end
