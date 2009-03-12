require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_patient
    assert_difference('Patient.count') do
      post :create, :patient => { }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  def test_should_show_patient
    get :show, :id => patients(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => patients(:one).id
    assert_response :success
  end

  def test_should_update_patient
    put :update, :id => patients(:one).id, :patient => { }
    assert_redirected_to patient_path(assigns(:patient))
  end

  def test_should_destroy_patient
    assert_difference('Patient.count', -1) do
      delete :destroy, :id => patients(:one).id
    end

    assert_redirected_to patients_path
  end
end
