require 'spec_helper'

describe PatientsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patients" }.should route_to(:controller => "patients", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patients/new" }.should route_to(:controller => "patients", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patients/1" }.should route_to(:controller => "patients", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patients/1/edit" }.should route_to(:controller => "patients", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patients" }.should route_to(:controller => "patients", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patients/1" }.should route_to(:controller => "patients", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patients/1" }.should route_to(:controller => "patients", :action => "destroy", :id => "1") 
    end
  end
end
