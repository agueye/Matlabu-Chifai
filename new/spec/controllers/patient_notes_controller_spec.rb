require 'spec_helper'

describe PatientNotesController do

  def mock_patient_note(stubs={})
    @mock_patient_note ||= mock_model(PatientNote, stubs)
  end

  describe "GET index" do
    it "assigns all patient_notes as @patient_notes" do
      PatientNote.stub!(:find).with(:all).and_return([mock_patient_note])
      get :index
      assigns[:patient_notes].should == [mock_patient_note]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_note as @patient_note" do
      PatientNote.stub!(:find).with("37").and_return(mock_patient_note)
      get :show, :id => "37"
      assigns[:patient_note].should equal(mock_patient_note)
    end
  end

  describe "GET new" do
    it "assigns a new patient_note as @patient_note" do
      PatientNote.stub!(:new).and_return(mock_patient_note)
      get :new
      assigns[:patient_note].should equal(mock_patient_note)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_note as @patient_note" do
      PatientNote.stub!(:find).with("37").and_return(mock_patient_note)
      get :edit, :id => "37"
      assigns[:patient_note].should equal(mock_patient_note)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_note as @patient_note" do
        PatientNote.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_note(:save => true))
        post :create, :patient_note => {:these => 'params'}
        assigns[:patient_note].should equal(mock_patient_note)
      end

      it "redirects to the created patient_note" do
        PatientNote.stub!(:new).and_return(mock_patient_note(:save => true))
        post :create, :patient_note => {}
        response.should redirect_to(patient_note_url(mock_patient_note))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_note as @patient_note" do
        PatientNote.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_note(:save => false))
        post :create, :patient_note => {:these => 'params'}
        assigns[:patient_note].should equal(mock_patient_note)
      end

      it "re-renders the 'new' template" do
        PatientNote.stub!(:new).and_return(mock_patient_note(:save => false))
        post :create, :patient_note => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_note" do
        PatientNote.should_receive(:find).with("37").and_return(mock_patient_note)
        mock_patient_note.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_note => {:these => 'params'}
      end

      it "assigns the requested patient_note as @patient_note" do
        PatientNote.stub!(:find).and_return(mock_patient_note(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_note].should equal(mock_patient_note)
      end

      it "redirects to the patient_note" do
        PatientNote.stub!(:find).and_return(mock_patient_note(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_note_url(mock_patient_note))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_note" do
        PatientNote.should_receive(:find).with("37").and_return(mock_patient_note)
        mock_patient_note.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_note => {:these => 'params'}
      end

      it "assigns the patient_note as @patient_note" do
        PatientNote.stub!(:find).and_return(mock_patient_note(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_note].should equal(mock_patient_note)
      end

      it "re-renders the 'edit' template" do
        PatientNote.stub!(:find).and_return(mock_patient_note(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_note" do
      PatientNote.should_receive(:find).with("37").and_return(mock_patient_note)
      mock_patient_note.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_notes list" do
      PatientNote.stub!(:find).and_return(mock_patient_note(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_notes_url)
    end
  end

end
