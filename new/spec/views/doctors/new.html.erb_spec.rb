require 'spec_helper'

describe "/doctors/new.html.erb" do
  include DoctorsHelper

  before(:each) do
    assigns[:doctor] = stub_model(Doctor,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new doctor form" do
    render

    response.should have_tag("form[action=?][method=post]", doctors_path) do
      with_tag("input#doctor_name[name=?]", "doctor[name]")
      with_tag("textarea#doctor_notes[name=?]", "doctor[notes]")
    end
  end
end
