require 'spec_helper'

describe PatientVisitsController do

  def mock_patient_visit(stubs={})
    @mock_patient_visit ||= mock_model(PatientVisit, stubs)
  end

  describe "GET index" do
    it "assigns all patient_visits as @patient_visits" do
      PatientVisit.stub!(:find).with(:all).and_return([mock_patient_visit])
      get :index
      assigns[:patient_visits].should == [mock_patient_visit]
    end
  end

  describe "GET show" do
    it "assigns the requested patient_visit as @patient_visit" do
      PatientVisit.stub!(:find).with("37").and_return(mock_patient_visit)
      get :show, :id => "37"
      assigns[:patient_visit].should equal(mock_patient_visit)
    end
  end

  describe "GET new" do
    it "assigns a new patient_visit as @patient_visit" do
      PatientVisit.stub!(:new).and_return(mock_patient_visit)
      get :new
      assigns[:patient_visit].should equal(mock_patient_visit)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient_visit as @patient_visit" do
      PatientVisit.stub!(:find).with("37").and_return(mock_patient_visit)
      get :edit, :id => "37"
      assigns[:patient_visit].should equal(mock_patient_visit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created patient_visit as @patient_visit" do
        PatientVisit.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_visit(:save => true))
        post :create, :patient_visit => {:these => 'params'}
        assigns[:patient_visit].should equal(mock_patient_visit)
      end

      it "redirects to the created patient_visit" do
        PatientVisit.stub!(:new).and_return(mock_patient_visit(:save => true))
        post :create, :patient_visit => {}
        response.should redirect_to(patient_visit_url(mock_patient_visit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient_visit as @patient_visit" do
        PatientVisit.stub!(:new).with({'these' => 'params'}).and_return(mock_patient_visit(:save => false))
        post :create, :patient_visit => {:these => 'params'}
        assigns[:patient_visit].should equal(mock_patient_visit)
      end

      it "re-renders the 'new' template" do
        PatientVisit.stub!(:new).and_return(mock_patient_visit(:save => false))
        post :create, :patient_visit => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested patient_visit" do
        PatientVisit.should_receive(:find).with("37").and_return(mock_patient_visit)
        mock_patient_visit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_visit => {:these => 'params'}
      end

      it "assigns the requested patient_visit as @patient_visit" do
        PatientVisit.stub!(:find).and_return(mock_patient_visit(:update_attributes => true))
        put :update, :id => "1"
        assigns[:patient_visit].should equal(mock_patient_visit)
      end

      it "redirects to the patient_visit" do
        PatientVisit.stub!(:find).and_return(mock_patient_visit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(patient_visit_url(mock_patient_visit))
      end
    end

    describe "with invalid params" do
      it "updates the requested patient_visit" do
        PatientVisit.should_receive(:find).with("37").and_return(mock_patient_visit)
        mock_patient_visit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :patient_visit => {:these => 'params'}
      end

      it "assigns the patient_visit as @patient_visit" do
        PatientVisit.stub!(:find).and_return(mock_patient_visit(:update_attributes => false))
        put :update, :id => "1"
        assigns[:patient_visit].should equal(mock_patient_visit)
      end

      it "re-renders the 'edit' template" do
        PatientVisit.stub!(:find).and_return(mock_patient_visit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested patient_visit" do
      PatientVisit.should_receive(:find).with("37").and_return(mock_patient_visit)
      mock_patient_visit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the patient_visits list" do
      PatientVisit.stub!(:find).and_return(mock_patient_visit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(patient_visits_url)
    end
  end

end
