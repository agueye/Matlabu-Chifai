require 'spec_helper'

describe "/patient_medications/index.html.erb" do
  include PatientMedicationsHelper

  before(:each) do
    assigns[:patient_medications] = [
      stub_model(PatientMedications,
        :medication => 1,
        :patient => 1,
        :doctor => 1,
        :condition => 1,
        :dosage => "value for dosage",
        :frequency => "value for frequency",
        :notes => "value for notes"
      ),
      stub_model(PatientMedications,
        :medication => 1,
        :patient => 1,
        :doctor => 1,
        :condition => 1,
        :dosage => "value for dosage",
        :frequency => "value for frequency",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of patient_medications" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for dosage".to_s, 2)
    response.should have_tag("tr>td", "value for frequency".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
