require 'spec_helper'

describe "/medications/show.html.erb" do
  include MedicationsHelper
  before(:each) do
    assigns[:medication] = @medication = stub_model(Medication,
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
