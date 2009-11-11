require 'spec_helper'

describe "/doctors/index.html.erb" do
  include DoctorsHelper

  before(:each) do
    assigns[:doctors] = [
      stub_model(Doctor,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(Doctor,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of doctors" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
