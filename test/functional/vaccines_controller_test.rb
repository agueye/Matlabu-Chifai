require 'test_helper'

class VaccinesControllerTest < ActionController::TestCase
  setup do
    @vaccine = vaccines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaccines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaccine" do
    assert_difference('Vaccine.count') do
      post :create, vaccine: @vaccine.attributes
    end

    assert_redirected_to vaccine_path(assigns(:vaccine))
  end

  test "should show vaccine" do
    get :show, id: @vaccine.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vaccine.to_param
    assert_response :success
  end

  test "should update vaccine" do
    put :update, id: @vaccine.to_param, vaccine: @vaccine.attributes
    assert_redirected_to vaccine_path(assigns(:vaccine))
  end

  test "should destroy vaccine" do
    assert_difference('Vaccine.count', -1) do
      delete :destroy, id: @vaccine.to_param
    end

    assert_redirected_to vaccines_path
  end
end
