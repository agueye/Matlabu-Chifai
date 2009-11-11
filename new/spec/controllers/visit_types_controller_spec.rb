require 'spec_helper'

describe VisitTypesController do

  def mock_visit_type(stubs={})
    @mock_visit_type ||= mock_model(VisitType, stubs)
  end

  describe "GET index" do
    it "assigns all visit_types as @visit_types" do
      VisitType.stub!(:find).with(:all).and_return([mock_visit_type])
      get :index
      assigns[:visit_types].should == [mock_visit_type]
    end
  end

  describe "GET show" do
    it "assigns the requested visit_type as @visit_type" do
      VisitType.stub!(:find).with("37").and_return(mock_visit_type)
      get :show, :id => "37"
      assigns[:visit_type].should equal(mock_visit_type)
    end
  end

  describe "GET new" do
    it "assigns a new visit_type as @visit_type" do
      VisitType.stub!(:new).and_return(mock_visit_type)
      get :new
      assigns[:visit_type].should equal(mock_visit_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested visit_type as @visit_type" do
      VisitType.stub!(:find).with("37").and_return(mock_visit_type)
      get :edit, :id => "37"
      assigns[:visit_type].should equal(mock_visit_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created visit_type as @visit_type" do
        VisitType.stub!(:new).with({'these' => 'params'}).and_return(mock_visit_type(:save => true))
        post :create, :visit_type => {:these => 'params'}
        assigns[:visit_type].should equal(mock_visit_type)
      end

      it "redirects to the created visit_type" do
        VisitType.stub!(:new).and_return(mock_visit_type(:save => true))
        post :create, :visit_type => {}
        response.should redirect_to(visit_type_url(mock_visit_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved visit_type as @visit_type" do
        VisitType.stub!(:new).with({'these' => 'params'}).and_return(mock_visit_type(:save => false))
        post :create, :visit_type => {:these => 'params'}
        assigns[:visit_type].should equal(mock_visit_type)
      end

      it "re-renders the 'new' template" do
        VisitType.stub!(:new).and_return(mock_visit_type(:save => false))
        post :create, :visit_type => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested visit_type" do
        VisitType.should_receive(:find).with("37").and_return(mock_visit_type)
        mock_visit_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :visit_type => {:these => 'params'}
      end

      it "assigns the requested visit_type as @visit_type" do
        VisitType.stub!(:find).and_return(mock_visit_type(:update_attributes => true))
        put :update, :id => "1"
        assigns[:visit_type].should equal(mock_visit_type)
      end

      it "redirects to the visit_type" do
        VisitType.stub!(:find).and_return(mock_visit_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(visit_type_url(mock_visit_type))
      end
    end

    describe "with invalid params" do
      it "updates the requested visit_type" do
        VisitType.should_receive(:find).with("37").and_return(mock_visit_type)
        mock_visit_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :visit_type => {:these => 'params'}
      end

      it "assigns the visit_type as @visit_type" do
        VisitType.stub!(:find).and_return(mock_visit_type(:update_attributes => false))
        put :update, :id => "1"
        assigns[:visit_type].should equal(mock_visit_type)
      end

      it "re-renders the 'edit' template" do
        VisitType.stub!(:find).and_return(mock_visit_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested visit_type" do
      VisitType.should_receive(:find).with("37").and_return(mock_visit_type)
      mock_visit_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the visit_types list" do
      VisitType.stub!(:find).and_return(mock_visit_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(visit_types_url)
    end
  end

end
