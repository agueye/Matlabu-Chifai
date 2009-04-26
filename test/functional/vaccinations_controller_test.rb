require 'test_helper'

class VaccinationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaccinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaccination" do
    assert_difference('Vaccination.count') do
      post :create, :vaccination => { }
    end

    assert_redirected_to vaccination_path(assigns(:vaccination))
  end

  test "should show vaccination" do
    get :show, :id => vaccinations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vaccinations(:one).id
    assert_response :success
  end

  test "should update vaccination" do
    put :update, :id => vaccinations(:one).id, :vaccination => { }
    assert_redirected_to vaccination_path(assigns(:vaccination))
  end

  test "should destroy vaccination" do
    assert_difference('Vaccination.count', -1) do
      delete :destroy, :id => vaccinations(:one).id
    end

    assert_redirected_to vaccinations_path
  end
end
