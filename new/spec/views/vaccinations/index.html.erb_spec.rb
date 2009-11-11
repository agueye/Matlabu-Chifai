require 'spec_helper'

describe "/vaccinations/index.html.erb" do
  include VaccinationsHelper

  before(:each) do
    assigns[:vaccinations] = [
      stub_model(Vaccination,
        :name => "value for name",
        :notes => "value for notes"
      ),
      stub_model(Vaccination,
        :name => "value for name",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of vaccinations" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end
