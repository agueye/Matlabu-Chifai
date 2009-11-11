require 'spec_helper'

describe "/patient_vaccinations/edit.html.erb" do
  include PatientVaccinationsHelper

  before(:each) do
    assigns[:patient_vaccination] = @patient_vaccination = stub_model(PatientVaccination,
      :new_record? => false,
      :patient => 1,
      :vaccination => 1,
      :notes => "value for notes"
    )
  end

  it "renders the edit patient_vaccination form" do
    render

    response.should have_tag("form[action=#{patient_vaccination_path(@patient_vaccination)}][method=post]") do
      with_tag('input#patient_vaccination_patient[name=?]', "patient_vaccination[patient]")
      with_tag('input#patient_vaccination_vaccination[name=?]', "patient_vaccination[vaccination]")
      with_tag('textarea#patient_vaccination_notes[name=?]', "patient_vaccination[notes]")
    end
  end
end
