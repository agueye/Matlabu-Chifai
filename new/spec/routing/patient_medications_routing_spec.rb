require 'spec_helper'

describe PatientMedicationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_medications" }.should route_to(:controller => "patient_medications", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_medications/new" }.should route_to(:controller => "patient_medications", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_medications/1" }.should route_to(:controller => "patient_medications", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_medications/1/edit" }.should route_to(:controller => "patient_medications", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_medications" }.should route_to(:controller => "patient_medications", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_medications/1" }.should route_to(:controller => "patient_medications", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_medications/1" }.should route_to(:controller => "patient_medications", :action => "destroy", :id => "1") 
    end
  end
end
