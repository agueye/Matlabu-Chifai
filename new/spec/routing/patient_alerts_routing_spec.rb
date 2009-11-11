require 'spec_helper'

describe PatientAlertsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_alerts" }.should route_to(:controller => "patient_alerts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_alerts/new" }.should route_to(:controller => "patient_alerts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_alerts/1" }.should route_to(:controller => "patient_alerts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_alerts/1/edit" }.should route_to(:controller => "patient_alerts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_alerts" }.should route_to(:controller => "patient_alerts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_alerts/1" }.should route_to(:controller => "patient_alerts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_alerts/1" }.should route_to(:controller => "patient_alerts", :action => "destroy", :id => "1") 
    end
  end
end
