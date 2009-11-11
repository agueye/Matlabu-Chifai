require 'spec_helper'

describe "/doctors/edit.html.erb" do
  include DoctorsHelper

  before(:each) do
    assigns[:doctor] = @doctor = stub_model(Doctor,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit doctor form" do
    render

    response.should have_tag("form[action=#{doctor_path(@doctor)}][method=post]") do
      with_tag('input#doctor_name[name=?]', "doctor[name]")
      with_tag('textarea#doctor_notes[name=?]', "doctor[notes]")
    end
  end
end
