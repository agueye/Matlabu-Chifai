require 'spec_helper'

describe "/patient_visits/index.html.erb" do
  include PatientVisitsHelper

  before(:each) do
    assigns[:patient_visits] = [
      stub_model(PatientVisit,
        :patient => 1,
        :doctor => 1,
        :visit_type => 1,
        :condition => 1,
        :height => "value for height",
        :weight => "value for weight",
        :systolic => "value for systolic",
        :diastolic => "value for diastolic",
        :pulse => "value for pulse",
        :temperature => "value for temperature",
        :notes => "value for notes"
      ),
      stub_model(PatientVisit,
        :patient => 1,
        :doctor => 1,
        :visit_type => 1,
        :condition => 1,
        :height => "value for height",
        :weight => "value for weight",
        :systolic => "value for systolic",
        :diastolic => "value for diastolic",
        :pulse => "value for pulse",
        :temperature => "value for temperature",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of patient_visits" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for height".to_s, 2)
    response.should have_tag("tr>td", "value for weight".to_s, 2)
    response.should have_tag("tr>td", "value for systolic".to_s, 2)
    response.should have_tag("tr>td", "value for diastolic".to_s, 2)
    response.should have_tag("tr>td", "value for pulse".to_s, 2)
    response.should have_tag("tr>td", "value for temperature".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
