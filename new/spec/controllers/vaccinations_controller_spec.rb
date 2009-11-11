require 'spec_helper'

describe VaccinationsController do

  def mock_vaccination(stubs={})
    @mock_vaccination ||= mock_model(Vaccination, stubs)
  end

  describe "GET index" do
    it "assigns all vaccinations as @vaccinations" do
      Vaccination.stub!(:find).with(:all).and_return([mock_vaccination])
      get :index
      assigns[:vaccinations].should == [mock_vaccination]
    end
  end

  describe "GET show" do
    it "assigns the requested vaccination as @vaccination" do
      Vaccination.stub!(:find).with("37").and_return(mock_vaccination)
      get :show, :id => "37"
      assigns[:vaccination].should equal(mock_vaccination)
    end
  end

  describe "GET new" do
    it "assigns a new vaccination as @vaccination" do
      Vaccination.stub!(:new).and_return(mock_vaccination)
      get :new
      assigns[:vaccination].should equal(mock_vaccination)
    end
  end

  describe "GET edit" do
    it "assigns the requested vaccination as @vaccination" do
      Vaccination.stub!(:find).with("37").and_return(mock_vaccination)
      get :edit, :id => "37"
      assigns[:vaccination].should equal(mock_vaccination)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created vaccination as @vaccination" do
        Vaccination.stub!(:new).with({'these' => 'params'}).and_return(mock_vaccination(:save => true))
        post :create, :vaccination => {:these => 'params'}
        assigns[:vaccination].should equal(mock_vaccination)
      end

      it "redirects to the created vaccination" do
        Vaccination.stub!(:new).and_return(mock_vaccination(:save => true))
        post :create, :vaccination => {}
        response.should redirect_to(vaccination_url(mock_vaccination))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vaccination as @vaccination" do
        Vaccination.stub!(:new).with({'these' => 'params'}).and_return(mock_vaccination(:save => false))
        post :create, :vaccination => {:these => 'params'}
        assigns[:vaccination].should equal(mock_vaccination)
      end

      it "re-renders the 'new' template" do
        Vaccination.stub!(:new).and_return(mock_vaccination(:save => false))
        post :create, :vaccination => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested vaccination" do
        Vaccination.should_receive(:find).with("37").and_return(mock_vaccination)
        mock_vaccination.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vaccination => {:these => 'params'}
      end

      it "assigns the requested vaccination as @vaccination" do
        Vaccination.stub!(:find).and_return(mock_vaccination(:update_attributes => true))
        put :update, :id => "1"
        assigns[:vaccination].should equal(mock_vaccination)
      end

      it "redirects to the vaccination" do
        Vaccination.stub!(:find).and_return(mock_vaccination(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(vaccination_url(mock_vaccination))
      end
    end

    describe "with invalid params" do
      it "updates the requested vaccination" do
        Vaccination.should_receive(:find).with("37").and_return(mock_vaccination)
        mock_vaccination.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vaccination => {:these => 'params'}
      end

      it "assigns the vaccination as @vaccination" do
        Vaccination.stub!(:find).and_return(mock_vaccination(:update_attributes => false))
        put :update, :id => "1"
        assigns[:vaccination].should equal(mock_vaccination)
      end

      it "re-renders the 'edit' template" do
        Vaccination.stub!(:find).and_return(mock_vaccination(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested vaccination" do
      Vaccination.should_receive(:find).with("37").and_return(mock_vaccination)
      mock_vaccination.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vaccinations list" do
      Vaccination.stub!(:find).and_return(mock_vaccination(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(vaccinations_url)
    end
  end

end
