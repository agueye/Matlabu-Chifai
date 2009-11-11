require 'spec_helper'

describe "/visit_types/show.html.erb" do
  include VisitTypesHelper
  before(:each) do
    assigns[:visit_type] = @visit_type = stub_model(VisitType,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ notes/)
  end
end
