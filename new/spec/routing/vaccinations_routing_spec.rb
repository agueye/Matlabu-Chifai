require 'spec_helper'

describe VaccinationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/vaccinations" }.should route_to(:controller => "vaccinations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vaccinations/new" }.should route_to(:controller => "vaccinations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vaccinations/1" }.should route_to(:controller => "vaccinations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vaccinations/1/edit" }.should route_to(:controller => "vaccinations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vaccinations" }.should route_to(:controller => "vaccinations", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/vaccinations/1" }.should route_to(:controller => "vaccinations", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vaccinations/1" }.should route_to(:controller => "vaccinations", :action => "destroy", :id => "1") 
    end
  end
end
