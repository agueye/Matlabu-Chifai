require 'spec_helper'

describe "/patient_alerts/show.html.erb" do
  include PatientAlertsHelper
  before(:each) do
    assigns[:patient_alerts] = @patient_alerts = stub_model(PatientAlerts,
      :patient => 1,
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ notes/)
  end
end
