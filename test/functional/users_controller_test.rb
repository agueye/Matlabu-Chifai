require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @institution = Institution.create(:name => "testInstitution")
    @user = User.new(:username => "testUser", :email => "testEmail", :institution => @institution, :admin => 0)
    @user.password = "testPassword"
    @user.save!
    @admin = User.new(:username => "testAdmin", :email => "testEmail", :institution => @institution, :admin => 1)
    @admin.password = "testPassword"
    @admin.save!
    post :login, :username => 'testAdmin', :password => 'testPassword'
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
      @user = User.new(:username => "testUser1", :email => "unique", :institution => @institution, :admin => 0)
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
    post :login, :username => @user.username, :password => 'newPassword'
    get :index
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end

  test "logout should redirect to login" do
    get :logout
    assert_redirected_to :action => "login"
  end

  test "should not be able to access index when logged out" do
    get :logout
    get :index
    assert_redirected_to :action => "login"
  end

  test "user should be able to access index but not show" do
    get :logout
    post :login, :username => 'testUser', :password => 'testPassword'
    get :index
    assert_response :success
    get :show, :id => @user.to_param
    assert_redirected_to :action => "login"
  end

  test "admin should be able to access index and show" do
    get :logout
    post :login, :username => 'testAdmin', :password => 'testPassword'
    get :index
    assert_response :success
    get :show, :id => @user.to_param
    assert_response :success
  end

end
