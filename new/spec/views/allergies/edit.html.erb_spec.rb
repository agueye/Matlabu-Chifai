require 'spec_helper'

describe "/allergies/edit.html.erb" do
  include AllergiesHelper

  before(:each) do
    assigns[:allergy] = @allergy = stub_model(Allergy,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit allergy form" do
    render

    response.should have_tag("form[action=#{allergy_path(@allergy)}][method=post]") do
      with_tag('input#allergy_name[name=?]', "allergy[name]")
      with_tag('textarea#allergy_notes[name=?]', "allergy[notes]")
    end
  end
end
