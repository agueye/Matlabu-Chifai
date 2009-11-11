require 'spec_helper'

describe PatientAllergiesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_allergies" }.should route_to(:controller => "patient_allergies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_allergies/new" }.should route_to(:controller => "patient_allergies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_allergies/1" }.should route_to(:controller => "patient_allergies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_allergies/1/edit" }.should route_to(:controller => "patient_allergies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_allergies" }.should route_to(:controller => "patient_allergies", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_allergies/1" }.should route_to(:controller => "patient_allergies", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_allergies/1" }.should route_to(:controller => "patient_allergies", :action => "destroy", :id => "1") 
    end
  end
end
