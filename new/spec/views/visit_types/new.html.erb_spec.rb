require 'spec_helper'

describe "/visit_types/new.html.erb" do
  include VisitTypesHelper

  before(:each) do
    assigns[:visit_type] = stub_model(VisitType,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new visit_type form" do
    render

    response.should have_tag("form[action=?][method=post]", visit_types_path) do
      with_tag("input#visit_type_name[name=?]", "visit_type[name]")
      with_tag("textarea#visit_type_notes[name=?]", "visit_type[notes]")
    end
  end
end
