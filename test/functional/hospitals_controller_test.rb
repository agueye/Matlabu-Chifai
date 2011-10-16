require 'test_helper'

class HospitalsControllerTest < ActionController::TestCase
  setup do
    @hospital = hospitals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital" do
    assert_difference('Hospital.count') do
      post :create, :hospital => @hospital.attributes
    end

    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should show hospital" do
    get :show, :id => @hospital.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hospital.to_param
    assert_response :success
  end

  test "should update hospital" do
    put :update, :id => @hospital.to_param, :hospital => @hospital.attributes
    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should destroy hospital" do
    assert_difference('Hospital.count', -1) do
      delete :destroy, :id => @hospital.to_param
    end

    assert_redirected_to hospitals_path
  end
end
