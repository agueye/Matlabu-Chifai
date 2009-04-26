require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, :patient => { }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, :id => patients(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patients(:one).id
    assert_response :success
  end

  test "should update patient" do
    put :update, :id => patients(:one).id, :patient => { }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, :id => patients(:one).id
    end

    assert_redirected_to patients_path
  end
end
