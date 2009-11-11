require 'spec_helper'

describe "/allergies/show.html.erb" do
  include AllergiesHelper
  before(:each) do
    assigns[:allergy] = @allergy = stub_model(Allergy,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ notes/)
  end
end
