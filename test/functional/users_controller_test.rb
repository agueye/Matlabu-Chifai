require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @institution = Institution.create(:name => "testInstitution")
    @user = User.new(:name => "testUser", :email => "testEmail", :institution => @institution, :admin => 0)
    @user.password = "testPassword"
    @user.save!
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      @user = User.new(:name => "testUser1", :email => "unique", :institution => @institution, :admin => 0)
      post :create, :user => @user.attributes, :password => "testPassword"
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should update password" do
    put :update, :id => @user.to_param, :user => @user.attributes, :password => "newPassword"
    assert_redirected_to user_path(assigns(:user))
    #test login with new password
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end
end
