require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post :create, :doctor => @doctor.attributes
    end

    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should show doctor" do
    get :show, :id => @doctor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @doctor.to_param
    assert_response :success
  end

  test "should update doctor" do
    put :update, :id => @doctor.to_param, :doctor => @doctor.attributes
    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete :destroy, :id => @doctor.to_param
    end

    assert_redirected_to doctors_path
  end
end
