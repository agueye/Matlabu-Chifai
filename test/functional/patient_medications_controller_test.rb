require 'test_helper'

class PatientMedicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_medications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_medication" do
    assert_difference('PatientMedication.count') do
      post :create, :patient_medication => { }
    end

    assert_redirected_to patient_medication_path(assigns(:patient_medication))
  end

  test "should show patient_medication" do
    get :show, :id => patient_medications(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_medications(:one).id
    assert_response :success
  end

  test "should update patient_medication" do
    put :update, :id => patient_medications(:one).id, :patient_medication => { }
    assert_redirected_to patient_medication_path(assigns(:patient_medication))
  end

  test "should destroy patient_medication" do
    assert_difference('PatientMedication.count', -1) do
      delete :destroy, :id => patient_medications(:one).id
    end

    assert_redirected_to patient_medications_path
  end
end
