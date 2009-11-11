require 'spec_helper'

describe "/patient_notes/edit.html.erb" do
  include PatientNotesHelper

  before(:each) do
    assigns[:patient_note] = @patient_note = stub_model(PatientNote,
      :new_record? => false,
      :patient => 1,
      :body => "value for body"
    )
  end

  it "renders the edit patient_note form" do
    render

    response.should have_tag("form[action=#{patient_note_path(@patient_note)}][method=post]") do
      with_tag('input#patient_note_patient[name=?]', "patient_note[patient]")
      with_tag('textarea#patient_note_body[name=?]', "patient_note[body]")
    end
  end
end
