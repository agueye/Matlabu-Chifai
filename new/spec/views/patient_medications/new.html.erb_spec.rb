require 'spec_helper'

describe "/patient_medications/new.html.erb" do
  include PatientMedicationsHelper

  before(:each) do
    assigns[:patient_medications] = stub_model(PatientMedications,
      :new_record? => true,
      :medication => 1,
      :patient => 1,
      :doctor => 1,
      :condition => 1,
      :dosage => "value for dosage",
      :frequency => "value for frequency",
      :notes => "value for notes"
    )
  end

  it "renders new patient_medications form" do
    render

    response.should have_tag("form[action=?][method=post]", patient_medications_path) do
      with_tag("input#patient_medications_medication[name=?]", "patient_medications[medication]")
      with_tag("input#patient_medications_patient[name=?]", "patient_medications[patient]")
      with_tag("input#patient_medications_doctor[name=?]", "patient_medications[doctor]")
      with_tag("input#patient_medications_condition[name=?]", "patient_medications[condition]")
      with_tag("input#patient_medications_dosage[name=?]", "patient_medications[dosage]")
      with_tag("input#patient_medications_frequency[name=?]", "patient_medications[frequency]")
      with_tag("textarea#patient_medications_notes[name=?]", "patient_medications[notes]")
    end
  end
end
