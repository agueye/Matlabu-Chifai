require 'spec_helper'

describe "/patient_allergies/index.html.erb" do
  include PatientAllergiesHelper

  before(:each) do
    assigns[:patient_allergies] = [
      stub_model(PatientAllergies,
        :allergy => 1,
        :patient => 1,
        :severity => "value for severity",
        :reaction => "value for reaction",
        :notes => "value for notes"
      ),
      stub_model(PatientAllergies,
        :allergy => 1,
        :patient => 1,
        :severity => "value for severity",
        :reaction => "value for reaction",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of patient_allergies" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for severity".to_s, 2)
    response.should have_tag("tr>td", "value for reaction".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
