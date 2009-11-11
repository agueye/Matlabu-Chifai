require 'spec_helper'

describe "/patient_notes/show.html.erb" do
  include PatientNotesHelper
  before(:each) do
    assigns[:patient_note] = @patient_note = stub_model(PatientNote,
      :patient => 1,
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ body/)
  end
end
