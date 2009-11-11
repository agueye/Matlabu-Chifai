require 'spec_helper'

describe "/patient_alerts/index.html.erb" do
  include PatientAlertsHelper

  before(:each) do
    assigns[:patient_alerts] = [
      stub_model(PatientAlerts,
        :patient => 1,
        :notes => "value for notes"
      ),
      stub_model(PatientAlerts,
        :patient => 1,
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of patient_alerts" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
