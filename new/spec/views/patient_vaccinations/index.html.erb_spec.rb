require 'spec_helper'

describe "/patient_vaccinations/index.html.erb" do
  include PatientVaccinationsHelper

  before(:each) do
    assigns[:patient_vaccinations] = [
      stub_model(PatientVaccination,
        :patient => 1,
        :vaccination => 1,
        :notes => "value for notes"
      ),
      stub_model(PatientVaccination,
        :patient => 1,
        :vaccination => 1,
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of patient_vaccinations" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
