require 'spec_helper'

describe "/patient_alerts/new.html.erb" do
  include PatientAlertsHelper

  before(:each) do
    assigns[:patient_alerts] = stub_model(PatientAlerts,
      :new_record? => true,
      :patient => 1,
      :notes => "value for notes"
    )
  end

  it "renders new patient_alerts form" do
    render

    response.should have_tag("form[action=?][method=post]", patient_alerts_path) do
      with_tag("input#patient_alerts_patient[name=?]", "patient_alerts[patient]")
      with_tag("textarea#patient_alerts_notes[name=?]", "patient_alerts[notes]")
    end
  end
end
