require 'spec_helper'

describe "/medications/edit.html.erb" do
  include MedicationsHelper

  before(:each) do
    assigns[:medication] = @medication = stub_model(Medication,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit medication form" do
    render

    response.should have_tag("form[action=#{medication_path(@medication)}][method=post]") do
      with_tag('input#medication_name[name=?]', "medication[name]")
      with_tag('textarea#medication_notes[name=?]', "medication[notes]")
    end
  end
end
