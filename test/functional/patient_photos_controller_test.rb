require 'test_helper'

class PatientPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_photo" do
    assert_difference('PatientPhoto.count') do
      post :create, :patient_photo => { }
    end

    assert_redirected_to patient_photo_path(assigns(:patient_photo))
  end

  test "should show patient_photo" do
    get :show, :id => patient_photos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_photos(:one).id
    assert_response :success
  end

  test "should update patient_photo" do
    put :update, :id => patient_photos(:one).id, :patient_photo => { }
    assert_redirected_to patient_photo_path(assigns(:patient_photo))
  end

  test "should destroy patient_photo" do
    assert_difference('PatientPhoto.count', -1) do
      delete :destroy, :id => patient_photos(:one).id
    end

    assert_redirected_to patient_photos_path
  end
end
