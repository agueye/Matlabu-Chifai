require 'spec_helper'

describe "/doctors/show.html.erb" do
  include DoctorsHelper
  before(:each) do
    assigns[:doctor] = @doctor = stub_model(Doctor,
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
