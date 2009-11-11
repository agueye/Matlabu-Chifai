require 'spec_helper'

describe PatientsController do

  def mock_patient(stubs={})
    @mock_patient ||= mock_model(Patient, stubs)
  end

  describe "GET index" do
    it "assigns all patients as @patients" do
      Patient.stub!(:find).with(:all).and_return([mock_patient])
      get :index
      assigns[:patients].should == [mock_patient]
    end
  end

  describe "GET show" do
    it "assigns the requested patient as @patient" do
      Patient.stub!(:find).with("37").and_return(mock_patient)
      get :show, :id => "37"
      assigns[:patient].should equal(mock_patient)
    end
  end

  describe "GET new" do
    it "assigns a new patient as @patient" do
      Patient.stub!(:new).and_return(mock_patient)
      get :new
      assigns[:patient].should equal(mock_patient)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient as @patient" do
      Patient.stub!(:find).with("37").and_return(mock_patient)
      get :edit, :id => "37"
      assigns[:patient].should equal(mock_patient)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient as @patient" do
        Patient.stub!(:new).with({'these' => 'params'}).and_return(mock_patient(:save => true))
        post :create, :patient => {:these => 'params'}
        assigns[:patient].should equal(mock_patient)
      end

      it "redirects to the created patient" do
        Patient.stub!(:new).and_return(mock_patient(:save => true))
        post :create, :patient => {}
        response.should redirect_to(patient_url(mock_patient))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient as @patient" do
        Patient.stub!(:new).with({'these' => 'params'}).and_return(mock_patient(:save => false))
        post :create, :patient => {:these => 'params'}
        assigns[:patient].should equal(mock_patient)
      end

      it "re-renders the 'new' template" do
        Patient.stub!(:new).and_return(mock_patient(:save => false))
        post :create, :patient => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient" do
        Patient.should_receive(:find).with("37").and_return(mock_patient)
        mock_patient.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient => {:these => 'params'}
      end

      it "assigns the requested patient as @patient" do
        Patient.stub!(:find).and_return(mock_patient(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient].should equal(mock_patient)
      end

      it "redirects to the patient" do
        Patient.stub!(:find).and_return(mock_patient(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_url(mock_patient))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient" do
        Patient.should_receive(:find).with("37").and_return(mock_patient)
        mock_patient.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient => {:these => 'params'}
      end

      it "assigns the patient as @patient" do
        Patient.stub!(:find).and_return(mock_patient(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient].should equal(mock_patient)
      end

      it "re-renders the 'edit' template" do
        Patient.stub!(:find).and_return(mock_patient(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient" do
      Patient.should_receive(:find).with("37").and_return(mock_patient)
      mock_patient.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patients list" do
      Patient.stub!(:find).and_return(mock_patient(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patients_url)
    end
  end

end
