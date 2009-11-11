require 'spec_helper'

describe "/allergies/index.html.erb" do
  include AllergiesHelper

  before(:each) do
    assigns[:allergies] = [
      stub_model(Allergy,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(Allergy,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of allergies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
