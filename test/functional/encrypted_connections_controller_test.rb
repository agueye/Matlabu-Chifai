require 'test_helper'

class EncryptedConnectionsControllerTest < ActionController::TestCase
  setup do
    @encrypted_connection = encrypted_connections(:one)
    @encrypted_connection.public_key = 'unique'
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encrypted_connections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encrypted_connection" do
    assert_difference('EncryptedConnection.count') do
      post :create, :encrypted_connection => @encrypted_connection.attributes
    end

    assert_redirected_to encrypted_connection_path(assigns(:encrypted_connection))
  end

  test "should show encrypted_connection" do
    get :show, :id => @encrypted_connection.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @encrypted_connection.to_param
    assert_response :success
  end

  test "should update encrypted_connection" do
    put :update, :id => @encrypted_connection.to_param, :encrypted_connection => @encrypted_connection.attributes
    assert_redirected_to encrypted_connection_path(assigns(:encrypted_connection))
  end

  test "should destroy encrypted_connection" do
    assert_difference('EncryptedConnection.count', -1) do
      delete :destroy, :id => @encrypted_connection.to_param
    end

    assert_redirected_to encrypted_connections_path
  end
end
