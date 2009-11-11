require 'spec_helper'

describe "/conditions/show.html.erb" do
  include ConditionsHelper
  before(:each) do
    assigns[:condition] = @condition = stub_model(Condition,
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
