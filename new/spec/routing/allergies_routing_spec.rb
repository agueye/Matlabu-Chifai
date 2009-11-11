require 'spec_helper'

describe AllergiesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/allergies" }.should route_to(:controller => "allergies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/allergies/new" }.should route_to(:controller => "allergies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/allergies/1" }.should route_to(:controller => "allergies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/allergies/1/edit" }.should route_to(:controller => "allergies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/allergies" }.should route_to(:controller => "allergies", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/allergies/1" }.should route_to(:controller => "allergies", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/allergies/1" }.should route_to(:controller => "allergies", :action => "destroy", :id => "1") 
    end
  end
end
