require 'spec_helper'

describe "/patient_vaccinations/show.html.erb" do
  include PatientVaccinationsHelper
  before(:each) do
    assigns[:patient_vaccination] = @patient_vaccination = stub_model(PatientVaccination,
      :patient => 1,
      :vaccination => 1,
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ notes/)
  end
end
