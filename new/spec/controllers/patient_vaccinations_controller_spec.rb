require 'spec_helper'

describe PatientVaccinationsController do

  def mock_patient_vaccination(stubs={})
    @mock_patient_vaccination ||= mock_model(PatientVaccination, stubs)
  end

  describe "GET index" do
    it "assigns all patient_vaccinations as @patient_vaccinations" do
      PatientVaccination.stub!(:find).with(:all).and_return([mock_patient_vaccination])
      get :index
      assigns[:patient_vaccinations].should == [mock_patient_vaccination]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_vaccination as @patient_vaccination" do
      PatientVaccination.stub!(:find).with("37").and_return(mock_patient_vaccination)
      get :show, :id => "37"
      assigns[:patient_vaccination].should equal(mock_patient_vaccination)
    end
  end

  describe "GET new" do
    it "assigns a new patient_vaccination as @patient_vaccination" do
      PatientVaccination.stub!(:new).and_return(mock_patient_vaccination)
      get :new
      assigns[:patient_vaccination].should equal(mock_patient_vaccination)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_vaccination as @patient_vaccination" do
      PatientVaccination.stub!(:find).with("37").and_return(mock_patient_vaccination)
      get :edit, :id => "37"
      assigns[:patient_vaccination].should equal(mock_patient_vaccination)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_vaccination as @patient_vaccination" do
        PatientVaccination.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_vaccination(:save => true))
        post :create, :patient_vaccination => {:these => 'params'}
        assigns[:patient_vaccination].should equal(mock_patient_vaccination)
      end

      it "redirects to the created patient_vaccination" do
        PatientVaccination.stub!(:new).and_return(mock_patient_vaccination(:save => true))
        post :create, :patient_vaccination => {}
        response.should redirect_to(patient_vaccination_url(mock_patient_vaccination))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_vaccination as @patient_vaccination" do
        PatientVaccination.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_vaccination(:save => false))
        post :create, :patient_vaccination => {:these => 'params'}
        assigns[:patient_vaccination].should equal(mock_patient_vaccination)
      end

      it "re-renders the 'new' template" do
        PatientVaccination.stub!(:new).and_return(mock_patient_vaccination(:save => false))
        post :create, :patient_vaccination => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_vaccination" do
        PatientVaccination.should_receive(:find).with("37").and_return(mock_patient_vaccination)
        mock_patient_vaccination.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_vaccination => {:these => 'params'}
      end

      it "assigns the requested patient_vaccination as @patient_vaccination" do
        PatientVaccination.stub!(:find).and_return(mock_patient_vaccination(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_vaccination].should equal(mock_patient_vaccination)
      end

      it "redirects to the patient_vaccination" do
        PatientVaccination.stub!(:find).and_return(mock_patient_vaccination(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_vaccination_url(mock_patient_vaccination))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_vaccination" do
        PatientVaccination.should_receive(:find).with("37").and_return(mock_patient_vaccination)
        mock_patient_vaccination.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_vaccination => {:these => 'params'}
      end

      it "assigns the patient_vaccination as @patient_vaccination" do
        PatientVaccination.stub!(:find).and_return(mock_patient_vaccination(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_vaccination].should equal(mock_patient_vaccination)
      end

      it "re-renders the 'edit' template" do
        PatientVaccination.stub!(:find).and_return(mock_patient_vaccination(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_vaccination" do
      PatientVaccination.should_receive(:find).with("37").and_return(mock_patient_vaccination)
      mock_patient_vaccination.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_vaccinations list" do
      PatientVaccination.stub!(:find).and_return(mock_patient_vaccination(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_vaccinations_url)
    end
  end

end
