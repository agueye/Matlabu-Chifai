require 'spec_helper'

describe "/patient_allergies/show.html.erb" do
  include PatientAllergiesHelper
  before(:each) do
    assigns[:patient_allergies] = @patient_allergies = stub_model(PatientAllergies,
      :allergy => 1,
      :patient => 1,
      :severity => "value for severity",
      :reaction => "value for reaction",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ severity/)
    response.should have_text(/value\ for\ reaction/)
    response.should have_text(/value\ for\ notes/)
  end
end
