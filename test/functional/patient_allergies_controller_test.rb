require 'test_helper'

class PatientAllergiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_allergies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_allergy" do
    assert_difference('PatientAllergy.count') do
      post :create, :patient_allergy => { }
    end

    assert_redirected_to patient_allergy_path(assigns(:patient_allergy))
  end

  test "should show patient_allergy" do
    get :show, :id => patient_allergies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_allergies(:one).id
    assert_response :success
  end

  test "should update patient_allergy" do
    put :update, :id => patient_allergies(:one).id, :patient_allergy => { }
    assert_redirected_to patient_allergy_path(assigns(:patient_allergy))
  end

  test "should destroy patient_allergy" do
    assert_difference('PatientAllergy.count', -1) do
      delete :destroy, :id => patient_allergies(:one).id
    end

    assert_redirected_to patient_allergies_path
  end
end
