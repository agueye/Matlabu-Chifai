require 'spec_helper'

describe "/patient_medications/show.html.erb" do
  include PatientMedicationsHelper
  before(:each) do
    assigns[:patient_medications] = @patient_medications = stub_model(PatientMedications,
      :medication => 1,
      :patient => 1,
      :doctor => 1,
      :condition => 1,
      :dosage => "value for dosage",
      :frequency => "value for frequency",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ dosage/)
    response.should have_text(/value\ for\ frequency/)
    response.should have_text(/value\ for\ notes/)
  end
end
