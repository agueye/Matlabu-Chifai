require 'spec_helper'

describe "/medications/new.html.erb" do
  include MedicationsHelper

  before(:each) do
    assigns[:medication] = stub_model(Medication,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new medication form" do
    render

    response.should have_tag("form[action=?][method=post]", medications_path) do
      with_tag("input#medication_name[name=?]", "medication[name]")
      with_tag("textarea#medication_notes[name=?]", "medication[notes]")
    end
  end
end
