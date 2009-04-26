require 'test_helper'

class ConditionsControllerTest < ActionController::TestCase
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
      post :create, :condition => { }
    end

    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should show condition" do
    get :show, :id => conditions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => conditions(:one).id
    assert_response :success
  end

  test "should update condition" do
    put :update, :id => conditions(:one).id, :condition => { }
    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should destroy condition" do
    assert_difference('Condition.count', -1) do
      delete :destroy, :id => conditions(:one).id
    end

    assert_redirected_to conditions_path
  end
end
