require 'test_helper'

class VisitTypesControllerTest < ActionController::TestCase
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
      post :create, :visit_type => { }
    end

    assert_redirected_to visit_type_path(assigns(:visit_type))
  end

  test "should show visit_type" do
    get :show, :id => visit_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => visit_types(:one).id
    assert_response :success
  end

  test "should update visit_type" do
    put :update, :id => visit_types(:one).id, :visit_type => { }
    assert_redirected_to visit_type_path(assigns(:visit_type))
  end

  test "should destroy visit_type" do
    assert_difference('VisitType.count', -1) do
      delete :destroy, :id => visit_types(:one).id
    end

    assert_redirected_to visit_types_path
  end
end
