require 'test_helper'

class PatientNotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_note" do
    assert_difference('PatientNote.count') do
      post :create, :patient_note => { }
    end

    assert_redirected_to patient_note_path(assigns(:patient_note))
  end

  test "should show patient_note" do
    get :show, :id => patient_notes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patient_notes(:one).id
    assert_response :success
  end

  test "should update patient_note" do
    put :update, :id => patient_notes(:one).id, :patient_note => { }
    assert_redirected_to patient_note_path(assigns(:patient_note))
  end

  test "should destroy patient_note" do
    assert_difference('PatientNote.count', -1) do
      delete :destroy, :id => patient_notes(:one).id
    end

    assert_redirected_to patient_notes_path
  end
end
