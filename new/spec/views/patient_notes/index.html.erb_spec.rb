require 'spec_helper'

describe "/patient_notes/index.html.erb" do
  include PatientNotesHelper

  before(:each) do
    assigns[:patient_notes] = [
      stub_model(PatientNote,
        :patient => 1,
        :body => "value for body"
      ),
      stub_model(PatientNote,
        :patient => 1,
        :body => "value for body"
      )
    ]
  end

  it "renders a list of patient_notes" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end
