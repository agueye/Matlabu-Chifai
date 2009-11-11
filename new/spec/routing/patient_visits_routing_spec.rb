require 'spec_helper'

describe PatientVisitsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_visits" }.should route_to(:controller => "patient_visits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_visits/new" }.should route_to(:controller => "patient_visits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_visits/1" }.should route_to(:controller => "patient_visits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_visits/1/edit" }.should route_to(:controller => "patient_visits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_visits" }.should route_to(:controller => "patient_visits", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_visits/1" }.should route_to(:controller => "patient_visits", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_visits/1" }.should route_to(:controller => "patient_visits", :action => "destroy", :id => "1") 
    end
  end
end
