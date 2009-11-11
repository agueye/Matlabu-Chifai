require 'spec_helper'

describe PatientAlertsController do

  def mock_patient_alerts(stubs={})
    @mock_patient_alerts ||= mock_model(PatientAlerts, stubs)
  end

  describe "GET index" do
    it "assigns all patient_alerts as @patient_alerts" do
      PatientAlerts.stub!(:find).with(:all).and_return([mock_patient_alerts])
      get :index
      assigns[:patient_alerts].should == [mock_patient_alerts]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_alerts as @patient_alerts" do
      PatientAlerts.stub!(:find).with("37").and_return(mock_patient_alerts)
      get :show, :id => "37"
      assigns[:patient_alerts].should equal(mock_patient_alerts)
    end
  end

  describe "GET new" do
    it "assigns a new patient_alerts as @patient_alerts" do
      PatientAlerts.stub!(:new).and_return(mock_patient_alerts)
      get :new
      assigns[:patient_alerts].should equal(mock_patient_alerts)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_alerts as @patient_alerts" do
      PatientAlerts.stub!(:find).with("37").and_return(mock_patient_alerts)
      get :edit, :id => "37"
      assigns[:patient_alerts].should equal(mock_patient_alerts)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_alerts as @patient_alerts" do
        PatientAlerts.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_alerts(:save => true))
        post :create, :patient_alerts => {:these => 'params'}
        assigns[:patient_alerts].should equal(mock_patient_alerts)
      end

      it "redirects to the created patient_alerts" do
        PatientAlerts.stub!(:new).and_return(mock_patient_alerts(:save => true))
        post :create, :patient_alerts => {}
        response.should redirect_to(patient_alert_url(mock_patient_alerts))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_alerts as @patient_alerts" do
        PatientAlerts.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_alerts(:save => false))
        post :create, :patient_alerts => {:these => 'params'}
        assigns[:patient_alerts].should equal(mock_patient_alerts)
      end

      it "re-renders the 'new' template" do
        PatientAlerts.stub!(:new).and_return(mock_patient_alerts(:save => false))
        post :create, :patient_alerts => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_alerts" do
        PatientAlerts.should_receive(:find).with("37").and_return(mock_patient_alerts)
        mock_patient_alerts.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_alerts => {:these => 'params'}
      end

      it "assigns the requested patient_alerts as @patient_alerts" do
        PatientAlerts.stub!(:find).and_return(mock_patient_alerts(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_alerts].should equal(mock_patient_alerts)
      end

      it "redirects to the patient_alerts" do
        PatientAlerts.stub!(:find).and_return(mock_patient_alerts(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_alert_url(mock_patient_alerts))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_alerts" do
        PatientAlerts.should_receive(:find).with("37").and_return(mock_patient_alerts)
        mock_patient_alerts.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_alerts => {:these => 'params'}
      end

      it "assigns the patient_alerts as @patient_alerts" do
        PatientAlerts.stub!(:find).and_return(mock_patient_alerts(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_alerts].should equal(mock_patient_alerts)
      end

      it "re-renders the 'edit' template" do
        PatientAlerts.stub!(:find).and_return(mock_patient_alerts(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_alerts" do
      PatientAlerts.should_receive(:find).with("37").and_return(mock_patient_alerts)
      mock_patient_alerts.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_alerts list" do
      PatientAlerts.stub!(:find).and_return(mock_patient_alerts(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_alerts_url)
    end
  end

end
