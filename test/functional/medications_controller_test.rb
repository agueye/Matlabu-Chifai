require 'test_helper'

class MedicationsControllerTest < ActionController::TestCase
  setup do
    @medication = allergens(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medication" do
    assert_difference('Medication.count') do
      post :create, medication: @medication.attributes
    end

    assert_redirected_to medication_path(assigns(:medication))
  end

  test "should show medication" do
    get :show, id: @medication.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medication.to_param
    assert_response :success
  end

  test "should update medication" do
    put :update, id: @medication.to_param, medication: @medication.attributes
    assert_redirected_to medication_path(assigns(:medication))
  end

  test "should destroy medication" do
    assert_difference('Medication.count', -1) do
      delete :destroy, id: @medication.to_param
    end

    assert_redirected_to medications_path
  end
end
