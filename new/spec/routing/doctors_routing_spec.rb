require 'spec_helper'

describe DoctorsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/doctors" }.should route_to(:controller => "doctors", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/doctors/new" }.should route_to(:controller => "doctors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/doctors/1" }.should route_to(:controller => "doctors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/doctors/1/edit" }.should route_to(:controller => "doctors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/doctors" }.should route_to(:controller => "doctors", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/doctors/1" }.should route_to(:controller => "doctors", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/doctors/1" }.should route_to(:controller => "doctors", :action => "destroy", :id => "1") 
    end
  end
end
