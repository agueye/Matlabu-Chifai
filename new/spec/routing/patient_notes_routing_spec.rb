require 'spec_helper'

describe PatientNotesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/patient_notes" }.should route_to(:controller => "patient_notes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/patient_notes/new" }.should route_to(:controller => "patient_notes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/patient_notes/1" }.should route_to(:controller => "patient_notes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/patient_notes/1/edit" }.should route_to(:controller => "patient_notes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/patient_notes" }.should route_to(:controller => "patient_notes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/patient_notes/1" }.should route_to(:controller => "patient_notes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/patient_notes/1" }.should route_to(:controller => "patient_notes", :action => "destroy", :id => "1") 
    end
  end
end
