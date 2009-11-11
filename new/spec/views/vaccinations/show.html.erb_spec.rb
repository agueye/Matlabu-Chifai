require 'spec_helper'

describe "/vaccinations/show.html.erb" do
  include VaccinationsHelper
  before(:each) do
    assigns[:vaccination] = @vaccination = stub_model(Vaccination,
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
