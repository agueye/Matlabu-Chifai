require 'test_helper'

class DoctorsControllerTest < ActionController::TestCase
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
      post :create, :doctor => { }
    end

    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should show doctor" do
    get :show, :id => doctors(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doctors(:one).id
    assert_response :success
  end

  test "should update doctor" do
    put :update, :id => doctors(:one).id, :doctor => { }
    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete :destroy, :id => doctors(:one).id
    end

    assert_redirected_to doctors_path
  end
end
