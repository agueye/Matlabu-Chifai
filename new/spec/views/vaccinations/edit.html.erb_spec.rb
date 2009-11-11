require 'spec_helper'

describe "/vaccinations/edit.html.erb" do
  include VaccinationsHelper

  before(:each) do
    assigns[:vaccination] = @vaccination = stub_model(Vaccination,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit vaccination form" do
    render

    response.should have_tag("form[action=#{vaccination_path(@vaccination)}][method=post]") do
      with_tag('input#vaccination_name[name=?]', "vaccination[name]")
      with_tag('textarea#vaccination_notes[name=?]', "vaccination[notes]")
    end
  end
end
