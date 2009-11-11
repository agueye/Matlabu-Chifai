require 'spec_helper'

describe MedicationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/medications" }.should route_to(:controller => "medications", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/medications/new" }.should route_to(:controller => "medications", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/medications/1" }.should route_to(:controller => "medications", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/medications/1/edit" }.should route_to(:controller => "medications", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/medications" }.should route_to(:controller => "medications", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/medications/1" }.should route_to(:controller => "medications", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/medications/1" }.should route_to(:controller => "medications", :action => "destroy", :id => "1") 
    end
  end
end
