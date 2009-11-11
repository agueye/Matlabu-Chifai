require 'spec_helper'

describe "/visit_types/index.html.erb" do
  include VisitTypesHelper

  before(:each) do
    assigns[:visit_types] = [
      stub_model(VisitType,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(VisitType,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of visit_types" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
