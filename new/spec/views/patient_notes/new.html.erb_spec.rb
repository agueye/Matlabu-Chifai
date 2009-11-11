require 'spec_helper'

describe "/patient_notes/new.html.erb" do
  include PatientNotesHelper

  before(:each) do
    assigns[:patient_note] = stub_model(PatientNote,
      :new_record? => true,
      :patient => 1,
      :body => "value for body"
    )
  end

  it "renders new patient_note form" do
    render

    response.should have_tag("form[action=?][method=post]", patient_notes_path) do
      with_tag("input#patient_note_patient[name=?]", "patient_note[patient]")
      with_tag("textarea#patient_note_body[name=?]", "patient_note[body]")
    end
  end
end
