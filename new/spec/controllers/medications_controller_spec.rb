require 'spec_helper'

describe MedicationsController do

  def mock_medication(stubs={})
    @mock_medication ||= mock_model(Medication, stubs)
  end

  describe "GET index" do
    it "assigns all medications as @medications" do
      Medication.stub!(:find).with(:all).and_return([mock_medication])
      get :index
      assigns[:medications].should == [mock_medication]
    end
  end

  describe "GET show" do
    it "assigns the requested medication as @medication" do
      Medication.stub!(:find).with("37").and_return(mock_medication)
      get :show, :id => "37"
      assigns[:medication].should equal(mock_medication)
    end
  end

  describe "GET new" do
    it "assigns a new medication as @medication" do
      Medication.stub!(:new).and_return(mock_medication)
      get :new
      assigns[:medication].should equal(mock_medication)
    end
  end

  describe "GET edit" do
    it "assigns the requested medication as @medication" do
      Medication.stub!(:find).with("37").and_return(mock_medication)
      get :edit, :id => "37"
      assigns[:medication].should equal(mock_medication)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created medication as @medication" do
        Medication.stub!(:new).with({'these' => 'params'}).and_return(mock_medication(:save => true))
        post :create, :medication => {:these => 'params'}
        assigns[:medication].should equal(mock_medication)
      end

      it "redirects to the created medication" do
        Medication.stub!(:new).and_return(mock_medication(:save => true))
        post :create, :medication => {}
        response.should redirect_to(medication_url(mock_medication))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved medication as @medication" do
        Medication.stub!(:new).with({'these' => 'params'}).and_return(mock_medication(:save => false))
        post :create, :medication => {:these => 'params'}
        assigns[:medication].should equal(mock_medication)
      end

      it "re-renders the 'new' template" do
        Medication.stub!(:new).and_return(mock_medication(:save => false))
        post :create, :medication => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested medication" do
        Medication.should_receive(:find).with("37").and_return(mock_medication)
        mock_medication.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :medication => {:these => 'params'}
      end

      it "assigns the requested medication as @medication" do
        Medication.stub!(:find).and_return(mock_medication(:update_attributes => true))
        put :update, :id => "1"
        assigns[:medication].should equal(mock_medication)
      end

      it "redirects to the medication" do
        Medication.stub!(:find).and_return(mock_medication(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(medication_url(mock_medication))
      end
    end

    describe "with invalid params" do
      it "updates the requested medication" do
        Medication.should_receive(:find).with("37").and_return(mock_medication)
        mock_medication.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :medication => {:these => 'params'}
      end

      it "assigns the medication as @medication" do
        Medication.stub!(:find).and_return(mock_medication(:update_attributes => false))
        put :update, :id => "1"
        assigns[:medication].should equal(mock_medication)
      end

      it "re-renders the 'edit' template" do
        Medication.stub!(:find).and_return(mock_medication(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested medication" do
      Medication.should_receive(:find).with("37").and_return(mock_medication)
      mock_medication.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the medications list" do
      Medication.stub!(:find).and_return(mock_medication(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(medications_url)
    end
  end

end
