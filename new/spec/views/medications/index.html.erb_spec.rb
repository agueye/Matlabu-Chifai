require 'spec_helper'

describe "/medications/index.html.erb" do
  include MedicationsHelper

  before(:each) do
    assigns[:medications] = [
      stub_model(Medication,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(Medication,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of medications" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
