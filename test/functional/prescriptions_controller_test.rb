require 'test_helper'

class PrescriptionsControllerTest < ActionController::TestCase
  setup do
    @prescription = prescriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prescriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prescription" do
    assert_difference('Prescription.count') do
      post :create, prescription: @prescription.attributes
    end

    assert_redirected_to prescription_path(assigns(:prescription))
  end

  test "should show prescription" do
    get :show, id: @prescription.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prescription.to_param
    assert_response :success
  end

  test "should update prescription" do
    put :update, id: @prescription.to_param, prescription: @prescription.attributes
    assert_redirected_to prescription_path(assigns(:prescription))
  end

  test "should destroy prescription" do
    assert_difference('Prescription.count', -1) do
      delete :destroy, id: @prescription.to_param
    end

    assert_redirected_to prescriptions_path
  end
end
