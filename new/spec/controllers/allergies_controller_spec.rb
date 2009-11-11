require 'spec_helper'

describe AllergiesController do

  def mock_allergy(stubs={})
    @mock_allergy ||= mock_model(Allergy, stubs)
  end

  describe "GET index" do
    it "assigns all allergies as @allergies" do
      Allergy.stub!(:find).with(:all).and_return([mock_allergy])
      get :index
      assigns[:allergies].should == [mock_allergy]
    end
  end

  describe "GET show" do
    it "assigns the requested allergy as @allergy" do
      Allergy.stub!(:find).with("37").and_return(mock_allergy)
      get :show, :id => "37"
      assigns[:allergy].should equal(mock_allergy)
    end
  end

  describe "GET new" do
    it "assigns a new allergy as @allergy" do
      Allergy.stub!(:new).and_return(mock_allergy)
      get :new
      assigns[:allergy].should equal(mock_allergy)
    end
  end

  describe "GET edit" do
    it "assigns the requested allergy as @allergy" do
      Allergy.stub!(:find).with("37").and_return(mock_allergy)
      get :edit, :id => "37"
      assigns[:allergy].should equal(mock_allergy)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created allergy as @allergy" do
        Allergy.stub!(:new).with({'these' => 'params'}).and_return(mock_allergy(:save => true))
        post :create, :allergy => {:these => 'params'}
        assigns[:allergy].should equal(mock_allergy)
      end

      it "redirects to the created allergy" do
        Allergy.stub!(:new).and_return(mock_allergy(:save => true))
        post :create, :allergy => {}
        response.should redirect_to(allergy_url(mock_allergy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved allergy as @allergy" do
        Allergy.stub!(:new).with({'these' => 'params'}).and_return(mock_allergy(:save => false))
        post :create, :allergy => {:these => 'params'}
        assigns[:allergy].should equal(mock_allergy)
      end

      it "re-renders the 'new' template" do
        Allergy.stub!(:new).and_return(mock_allergy(:save => false))
        post :create, :allergy => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested allergy" do
        Allergy.should_receive(:find).with("37").and_return(mock_allergy)
        mock_allergy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :allergy => {:these => 'params'}
      end

      it "assigns the requested allergy as @allergy" do
        Allergy.stub!(:find).and_return(mock_allergy(:update_attributes => true))
        put :update, :id => "1"
        assigns[:allergy].should equal(mock_allergy)
      end

      it "redirects to the allergy" do
        Allergy.stub!(:find).and_return(mock_allergy(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(allergy_url(mock_allergy))
      end
    end

    describe "with invalid params" do
      it "updates the requested allergy" do
        Allergy.should_receive(:find).with("37").and_return(mock_allergy)
        mock_allergy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :allergy => {:these => 'params'}
      end

      it "assigns the allergy as @allergy" do
        Allergy.stub!(:find).and_return(mock_allergy(:update_attributes => false))
        put :update, :id => "1"
        assigns[:allergy].should equal(mock_allergy)
      end

      it "re-renders the 'edit' template" do
        Allergy.stub!(:find).and_return(mock_allergy(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested allergy" do
      Allergy.should_receive(:find).with("37").and_return(mock_allergy)
      mock_allergy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the allergies list" do
      Allergy.stub!(:find).and_return(mock_allergy(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(allergies_url)
    end
  end

end
