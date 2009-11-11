require 'spec_helper'

describe "/patient_allergies/edit.html.erb" do
  include PatientAllergiesHelper

  before(:each) do
    assigns[:patient_allergies] = @patient_allergies = stub_model(PatientAllergies,
      :new_record? => false,
      :allergy => 1,
      :patient => 1,
      :severity => "value for severity",
      :reaction => "value for reaction",
      :notes => "value for notes"
    )
  end

  it "renders the edit patient_allergies form" do
    render

    response.should have_tag("form[action=#{patient_allergies_path(@patient_allergies)}][method=post]") do
      with_tag('input#patient_allergies_allergy[name=?]', "patient_allergies[allergy]")
      with_tag('input#patient_allergies_patient[name=?]', "patient_allergies[patient]")
      with_tag('input#patient_allergies_severity[name=?]', "patient_allergies[severity]")
      with_tag('input#patient_allergies_reaction[name=?]', "patient_allergies[reaction]")
      with_tag('textarea#patient_allergies_notes[name=?]', "patient_allergies[notes]")
    end
  end
end
