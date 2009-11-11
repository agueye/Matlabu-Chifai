require 'spec_helper'

describe PatientMedicationsController do

  def mock_patient_medications(stubs={})
    @mock_patient_medications ||= mock_model(PatientMedications, stubs)
  end

  describe "GET index" do
    it "assigns all patient_medications as @patient_medications" do
      PatientMedications.stub!(:find).with(:all).and_return([mock_patient_medications])
      get :index
      assigns[:patient_medications].should == [mock_patient_medications]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_medications as @patient_medications" do
      PatientMedications.stub!(:find).with("37").and_return(mock_patient_medications)
      get :show, :id => "37"
      assigns[:patient_medications].should equal(mock_patient_medications)
    end
  end

  describe "GET new" do
    it "assigns a new patient_medications as @patient_medications" do
      PatientMedications.stub!(:new).and_return(mock_patient_medications)
      get :new
      assigns[:patient_medications].should equal(mock_patient_medications)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_medications as @patient_medications" do
      PatientMedications.stub!(:find).with("37").and_return(mock_patient_medications)
      get :edit, :id => "37"
      assigns[:patient_medications].should equal(mock_patient_medications)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_medications as @patient_medications" do
        PatientMedications.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_medications(:save => true))
        post :create, :patient_medications => {:these => 'params'}
        assigns[:patient_medications].should equal(mock_patient_medications)
      end

      it "redirects to the created patient_medications" do
        PatientMedications.stub!(:new).and_return(mock_patient_medications(:save => true))
        post :create, :patient_medications => {}
        response.should redirect_to(patient_medication_url(mock_patient_medications))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_medications as @patient_medications" do
        PatientMedications.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_medications(:save => false))
        post :create, :patient_medications => {:these => 'params'}
        assigns[:patient_medications].should equal(mock_patient_medications)
      end

      it "re-renders the 'new' template" do
        PatientMedications.stub!(:new).and_return(mock_patient_medications(:save => false))
        post :create, :patient_medications => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_medications" do
        PatientMedications.should_receive(:find).with("37").and_return(mock_patient_medications)
        mock_patient_medications.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_medications => {:these => 'params'}
      end

      it "assigns the requested patient_medications as @patient_medications" do
        PatientMedications.stub!(:find).and_return(mock_patient_medications(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_medications].should equal(mock_patient_medications)
      end

      it "redirects to the patient_medications" do
        PatientMedications.stub!(:find).and_return(mock_patient_medications(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_medication_url(mock_patient_medications))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_medications" do
        PatientMedications.should_receive(:find).with("37").and_return(mock_patient_medications)
        mock_patient_medications.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_medications => {:these => 'params'}
      end

      it "assigns the patient_medications as @patient_medications" do
        PatientMedications.stub!(:find).and_return(mock_patient_medications(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_medications].should equal(mock_patient_medications)
      end

      it "re-renders the 'edit' template" do
        PatientMedications.stub!(:find).and_return(mock_patient_medications(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_medications" do
      PatientMedications.should_receive(:find).with("37").and_return(mock_patient_medications)
      mock_patient_medications.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_medications list" do
      PatientMedications.stub!(:find).and_return(mock_patient_medications(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_medications_url)
    end
  end

end
