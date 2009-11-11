require 'spec_helper'

describe ConditionsController do

  def mock_condition(stubs={})
    @mock_condition ||= mock_model(Condition, stubs)
  end

  describe "GET index" do
    it "assigns all conditions as @conditions" do
      Condition.stub!(:find).with(:all).and_return([mock_condition])
      get :index
      assigns[:conditions].should == [mock_condition]
    end
  end

  describe "GET show" do
    it "assigns the requested condition as @condition" do
      Condition.stub!(:find).with("37").and_return(mock_condition)
      get :show, :id => "37"
      assigns[:condition].should equal(mock_condition)
    end
  end

  describe "GET new" do
    it "assigns a new condition as @condition" do
      Condition.stub!(:new).and_return(mock_condition)
      get :new
      assigns[:condition].should equal(mock_condition)
    end
  end

  describe "GET edit" do
    it "assigns the requested condition as @condition" do
      Condition.stub!(:find).with("37").and_return(mock_condition)
      get :edit, :id => "37"
      assigns[:condition].should equal(mock_condition)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created condition as @condition" do
        Condition.stub!(:new).with({'these' => 'params'}).and_return(mock_condition(:save => true))
        post :create, :condition => {:these => 'params'}
        assigns[:condition].should equal(mock_condition)
      end

      it "redirects to the created condition" do
        Condition.stub!(:new).and_return(mock_condition(:save => true))
        post :create, :condition => {}
        response.should redirect_to(condition_url(mock_condition))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved condition as @condition" do
        Condition.stub!(:new).with({'these' => 'params'}).and_return(mock_condition(:save => false))
        post :create, :condition => {:these => 'params'}
        assigns[:condition].should equal(mock_condition)
      end

      it "re-renders the 'new' template" do
        Condition.stub!(:new).and_return(mock_condition(:save => false))
        post :create, :condition => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested condition" do
        Condition.should_receive(:find).with("37").and_return(mock_condition)
        mock_condition.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :condition => {:these => 'params'}
      end

      it "assigns the requested condition as @condition" do
        Condition.stub!(:find).and_return(mock_condition(:update_attributes => true))
        put :update, :id => "1"
        assigns[:condition].should equal(mock_condition)
      end

      it "redirects to the condition" do
        Condition.stub!(:find).and_return(mock_condition(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(condition_url(mock_condition))
      end
    end

    describe "with invalid params" do
      it "updates the requested condition" do
        Condition.should_receive(:find).with("37").and_return(mock_condition)
        mock_condition.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :condition => {:these => 'params'}
      end

      it "assigns the condition as @condition" do
        Condition.stub!(:find).and_return(mock_condition(:update_attributes => false))
        put :update, :id => "1"
        assigns[:condition].should equal(mock_condition)
      end

      it "re-renders the 'edit' template" do
        Condition.stub!(:find).and_return(mock_condition(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested condition" do
      Condition.should_receive(:find).with("37").and_return(mock_condition)
      mock_condition.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the conditions list" do
      Condition.stub!(:find).and_return(mock_condition(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(conditions_url)
    end
  end

end
