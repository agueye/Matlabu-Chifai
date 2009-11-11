require 'spec_helper'

describe VisitTypesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/visit_types" }.should route_to(:controller => "visit_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/visit_types/new" }.should route_to(:controller => "visit_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/visit_types/1" }.should route_to(:controller => "visit_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/visit_types/1/edit" }.should route_to(:controller => "visit_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/visit_types" }.should route_to(:controller => "visit_types", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/visit_types/1" }.should route_to(:controller => "visit_types", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/visit_types/1" }.should route_to(:controller => "visit_types", :action => "destroy", :id => "1") 
    end
  end
end
