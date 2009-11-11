require 'spec_helper'

describe "/conditions/index.html.erb" do
  include ConditionsHelper

  before(:each) do
    assigns[:conditions] = [
      stub_model(Condition,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(Condition,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of conditions" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
