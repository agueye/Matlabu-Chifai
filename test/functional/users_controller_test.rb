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

  test "user should be able to access index but not edit" do
    get :logout
    post :login, :username => 'testUser', :password => 'testPassword'
    get :index
    assert_response :success
    get :edit, :id => @user.to_param
    assert_redirected_to :action => "login"
  end

  test "admin should be able to access index and edit" do
    get :logout
    post :login, :username => 'testAdmin', :password => 'testPassword'
    get :index
    assert_response :success
    get :edit, :id => @user.to_param
    assert_response :success
  end

    test "changing password" do
    get :logout
    user = User.new(:institution => @institution, :username => "testUser2", :email => "testEmail2", :admin => 0)
    user.password = "testPassword"
    user.save!
    post :login, :username => "testUser2", :password => "testPassword"
    post :change_password, :id => user.to_param, :current_password => 'wrong', :new_password => 'new', :confirm_new_password => 'new'
    get :logout
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :change_password, :id => user.to_param, :current_password => 'testPassword', :new_password => 'new', :confirm_new_password => 'different'
    get :logout
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :change_password, :id => user.to_param, :current_password => 'testPassword', :new_password => '', :confirm_new_password => ''
    get :logout
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :change_password, :id => user.to_param, :current_password => 'testPassword', :new_password => 'new', :confirm_new_password => 'new'
    get :logout
    post :login, :username => "testUser2", :password => "new"
    assert_redirected_to :action => :show, :id => user.to_param
  end

  test "resetting password" do
    get :logout
    user = User.new(:institution => @institution, :username => "testUser2", :email => "testEmail2", :admin => 0)
    user.password = "testPassword"
    user.save!

    post :forgot_password, :username => "testUser2", :email => "wrong"
    user.reload

    post :reset_password, :id => user.to_param, :password_reset_token => user.password_reset_token, :new_password => 'new', :confirm_new_password => 'new'
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :forgot_password, :email => "testEmail2", :username => "testUser2"
    user.reload

    post :reset_password, :id => user.to_param, :password_reset_token => 'wrong', :new_password => 'new', :confirm_new_password => 'new'
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :reset_password, :id => user.to_param, :password_reset_token => user.password_reset_token, :new_password => 'new', :confirm_new_password => 'different'
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :reset_password, :id => user.to_param, :password_reset_token => user.password_reset_token, :new_password => '', :confirm_new_password => ''
    post :login, :username => "testUser2", :password => "testPassword"
    assert_redirected_to :action => :show, :id => user.to_param

    post :reset_password, :id => user.to_param, :password_reset_token => user.password_reset_token, :new_password => 'new', :confirm_new_password => 'new'
    post :login, :username => "testUser2", :password => "new"
    assert_redirected_to :action => :show, :id => user.to_param
  end

end
