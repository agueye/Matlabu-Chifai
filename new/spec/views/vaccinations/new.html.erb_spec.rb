require 'spec_helper'

describe "/vaccinations/new.html.erb" do
  include VaccinationsHelper

  before(:each) do
    assigns[:vaccination] = stub_model(Vaccination,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new vaccination form" do
    render

    response.should have_tag("form[action=?][method=post]", vaccinations_path) do
      with_tag("input#vaccination_name[name=?]", "vaccination[name]")
      with_tag("textarea#vaccination_notes[name=?]", "vaccination[notes]")
    end
  end
end
