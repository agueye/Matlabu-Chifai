require 'test_helper'

class ConditionsControllerTest < ActionController::TestCase
  setup do
    @condition = conditions(:one)
    @condition.name = 'testcondition'
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condition" do
    assert_difference('Condition.count') do
      post :create, condition: @condition.attributes
    end

    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should show condition" do
    get :show, id: @condition.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condition.to_param
    assert_response :success
  end

  test "should update condition" do
    put :update, id: @condition.to_param, condition: @condition.attributes
    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should destroy condition" do
    assert_difference('Condition.count', -1) do
      delete :destroy, id: @condition.to_param
    end

    assert_redirected_to conditions_path
  end
end
