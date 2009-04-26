require 'test_helper'

class PatientVaccinationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_vaccinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_vaccination" do
    assert_difference('PatientVaccination.count') do
      post :create, :patient_vaccination => { }
    end

    assert_redirected_to patient_vaccination_path(assigns(:patient_vaccination))
  end

  test "should show patient_vaccination" do
    get :show, :id => patient_vaccinations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_vaccinations(:one).id
    assert_response :success
  end

  test "should update patient_vaccination" do
    put :update, :id => patient_vaccinations(:one).id, :patient_vaccination => { }
    assert_redirected_to patient_vaccination_path(assigns(:patient_vaccination))
  end

  test "should destroy patient_vaccination" do
    assert_difference('PatientVaccination.count', -1) do
      delete :destroy, :id => patient_vaccinations(:one).id
    end

    assert_redirected_to patient_vaccinations_path
  end
end
