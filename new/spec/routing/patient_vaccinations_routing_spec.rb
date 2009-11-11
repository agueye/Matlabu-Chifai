require 'spec_helper'

describe PatientVaccinationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_vaccinations" }.should route_to(:controller => "patient_vaccinations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_vaccinations/new" }.should route_to(:controller => "patient_vaccinations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_vaccinations/1" }.should route_to(:controller => "patient_vaccinations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_vaccinations/1/edit" }.should route_to(:controller => "patient_vaccinations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_vaccinations" }.should route_to(:controller => "patient_vaccinations", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_vaccinations/1" }.should route_to(:controller => "patient_vaccinations", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_vaccinations/1" }.should route_to(:controller => "patient_vaccinations", :action => "destroy", :id => "1") 
    end
  end
end
