require 'spec_helper'

describe PatientAllergiesController do

  def mock_patient_allergies(stubs={})
    @mock_patient_allergies ||= mock_model(PatientAllergies, stubs)
  end

  describe "GET index" do
    it "assigns all patient_allergies as @patient_allergies" do
      PatientAllergies.stub!(:find).with(:all).and_return([mock_patient_allergies])
      get :index
      assigns[:patient_allergies].should == [mock_patient_allergies]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_allergies as @patient_allergies" do
      PatientAllergies.stub!(:find).with("37").and_return(mock_patient_allergies)
      get :show, :id => "37"
      assigns[:patient_allergies].should equal(mock_patient_allergies)
    end
  end

  describe "GET new" do
    it "assigns a new patient_allergies as @patient_allergies" do
      PatientAllergies.stub!(:new).and_return(mock_patient_allergies)
      get :new
      assigns[:patient_allergies].should equal(mock_patient_allergies)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_allergies as @patient_allergies" do
      PatientAllergies.stub!(:find).with("37").and_return(mock_patient_allergies)
      get :edit, :id => "37"
      assigns[:patient_allergies].should equal(mock_patient_allergies)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_allergies as @patient_allergies" do
        PatientAllergies.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_allergies(:save => true))
        post :create, :patient_allergies => {:these => 'params'}
        assigns[:patient_allergies].should equal(mock_patient_allergies)
      end

      it "redirects to the created patient_allergies" do
        PatientAllergies.stub!(:new).and_return(mock_patient_allergies(:save => true))
        post :create, :patient_allergies => {}
        response.should redirect_to(patient_allergy_url(mock_patient_allergies))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_allergies as @patient_allergies" do
        PatientAllergies.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_allergies(:save => false))
        post :create, :patient_allergies => {:these => 'params'}
        assigns[:patient_allergies].should equal(mock_patient_allergies)
      end

      it "re-renders the 'new' template" do
        PatientAllergies.stub!(:new).and_return(mock_patient_allergies(:save => false))
        post :create, :patient_allergies => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_allergies" do
        PatientAllergies.should_receive(:find).with("37").and_return(mock_patient_allergies)
        mock_patient_allergies.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_allergies => {:these => 'params'}
      end

      it "assigns the requested patient_allergies as @patient_allergies" do
        PatientAllergies.stub!(:find).and_return(mock_patient_allergies(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_allergies].should equal(mock_patient_allergies)
      end

      it "redirects to the patient_allergies" do
        PatientAllergies.stub!(:find).and_return(mock_patient_allergies(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_allergy_url(mock_patient_allergies))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_allergies" do
        PatientAllergies.should_receive(:find).with("37").and_return(mock_patient_allergies)
        mock_patient_allergies.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_allergies => {:these => 'params'}
      end

      it "assigns the patient_allergies as @patient_allergies" do
        PatientAllergies.stub!(:find).and_return(mock_patient_allergies(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_allergies].should equal(mock_patient_allergies)
      end

      it "re-renders the 'edit' template" do
        PatientAllergies.stub!(:find).and_return(mock_patient_allergies(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_allergies" do
      PatientAllergies.should_receive(:find).with("37").and_return(mock_patient_allergies)
      mock_patient_allergies.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_allergies list" do
      PatientAllergies.stub!(:find).and_return(mock_patient_allergies(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_allergies_url)
    end
  end

end
