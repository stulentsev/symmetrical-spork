require 'test_helper'

class StudentProfessionalProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_professional_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_professional_profile" do
    assert_difference('StudentProfessionalProfile.count') do
      post :create, :student_professional_profile => { }
    end

    assert_redirected_to student_professional_profile_path(assigns(:student_professional_profile))
  end

  test "should show student_professional_profile" do
    get :show, :id => student_professional_profiles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => student_professional_profiles(:one).id
    assert_response :success
  end

  test "should update student_professional_profile" do
    put :update, :id => student_professional_profiles(:one).id, :student_professional_profile => { }
    assert_redirected_to student_professional_profile_path(assigns(:student_professional_profile))
  end

  test "should destroy student_professional_profile" do
    assert_difference('StudentProfessionalProfile.count', -1) do
      delete :destroy, :id => student_professional_profiles(:one).id
    end

    assert_redirected_to student_professional_profiles_path
  end
end
