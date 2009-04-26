require 'test_helper'

class PatientAlertsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_alert" do
    assert_difference('PatientAlert.count') do
      post :create, :patient_alert => { }
    end

    assert_redirected_to patient_alert_path(assigns(:patient_alert))
  end

  test "should show patient_alert" do
    get :show, :id => patient_alerts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_alerts(:one).id
    assert_response :success
  end

  test "should update patient_alert" do
    put :update, :id => patient_alerts(:one).id, :patient_alert => { }
    assert_redirected_to patient_alert_path(assigns(:patient_alert))
  end

  test "should destroy patient_alert" do
    assert_difference('PatientAlert.count', -1) do
      delete :destroy, :id => patient_alerts(:one).id
    end

    assert_redirected_to patient_alerts_path
  end
end
