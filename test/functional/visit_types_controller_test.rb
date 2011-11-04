require 'test_helper'

class VisitTypesControllerTest < ActionController::TestCase
  setup do
    @visit_type = visit_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visit_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit_type" do
    assert_difference('VisitType.count') do
      post :create, :visit_type => @visit_type.attributes
    end

    assert_redirected_to visit_type_path(assigns(:visit_type))
  end

  test "should show visit_type" do
    get :show, :id => @visit_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @visit_type.to_param
    assert_response :success
  end

  test "should update visit_type" do
    put :update, :id => @visit_type.to_param, :visit_type => @visit_type.attributes
    assert_redirected_to visit_type_path(assigns(:visit_type))
  end

  test "should destroy visit_type" do
    assert_difference('VisitType.count', -1) do
      delete :destroy, :id => @visit_type.to_param
    end

    assert_redirected_to visit_types_path
  end
end
