require 'spec_helper'

describe "/patient_visits/new.html.erb" do
  include PatientVisitsHelper

  before(:each) do
    assigns[:patient_visit] = stub_model(PatientVisit,
      :new_record? => true,
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
  end

  it "renders new patient_visit form" do
    render

    response.should have_tag("form[action=?][method=post]", patient_visits_path) do
      with_tag("input#patient_visit_patient[name=?]", "patient_visit[patient]")
      with_tag("input#patient_visit_doctor[name=?]", "patient_visit[doctor]")
      with_tag("input#patient_visit_visit_type[name=?]", "patient_visit[visit_type]")
      with_tag("input#patient_visit_condition[name=?]", "patient_visit[condition]")
      with_tag("input#patient_visit_height[name=?]", "patient_visit[height]")
      with_tag("input#patient_visit_weight[name=?]", "patient_visit[weight]")
      with_tag("input#patient_visit_systolic[name=?]", "patient_visit[systolic]")
      with_tag("input#patient_visit_diastolic[name=?]", "patient_visit[diastolic]")
      with_tag("input#patient_visit_pulse[name=?]", "patient_visit[pulse]")
      with_tag("input#patient_visit_temperature[name=?]", "patient_visit[temperature]")
      with_tag("textarea#patient_visit_notes[name=?]", "patient_visit[notes]")
    end
  end
end
