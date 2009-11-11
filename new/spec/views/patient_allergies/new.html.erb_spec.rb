require 'spec_helper'

describe "/patient_allergies/new.html.erb" do
  include PatientAllergiesHelper

  before(:each) do
    assigns[:patient_allergies] = stub_model(PatientAllergies,
      :new_record? => true,
      :allergy => 1,
      :patient => 1,
      :severity => "value for severity",
      :reaction => "value for reaction",
      :notes => "value for notes"
    )
  end

  it "renders new patient_allergies form" do
    render

    response.should have_tag("form[action=?][method=post]", patient_allergies_path) do
      with_tag("input#patient_allergies_allergy[name=?]", "patient_allergies[allergy]")
      with_tag("input#patient_allergies_patient[name=?]", "patient_allergies[patient]")
      with_tag("input#patient_allergies_severity[name=?]", "patient_allergies[severity]")
      with_tag("input#patient_allergies_reaction[name=?]", "patient_allergies[reaction]")
      with_tag("textarea#patient_allergies_notes[name=?]", "patient_allergies[notes]")
    end
  end
end
