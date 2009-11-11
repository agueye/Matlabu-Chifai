require 'spec_helper'

describe "/allergies/new.html.erb" do
  include AllergiesHelper

  before(:each) do
    assigns[:allergy] = stub_model(Allergy,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new allergy form" do
    render

    response.should have_tag("form[action=?][method=post]", allergies_path) do
      with_tag("input#allergy_name[name=?]", "allergy[name]")
      with_tag("textarea#allergy_notes[name=?]", "allergy[notes]")
    end
  end
end
