require 'spec_helper'

describe ConditionsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/conditions" }.should route_to(:controller => "conditions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/conditions/new" }.should route_to(:controller => "conditions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/conditions/1" }.should route_to(:controller => "conditions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/conditions/1/edit" }.should route_to(:controller => "conditions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/conditions" }.should route_to(:controller => "conditions", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/conditions/1" }.should route_to(:controller => "conditions", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/conditions/1" }.should route_to(:controller => "conditions", :action => "destroy", :id => "1") 
    end
  end
end
