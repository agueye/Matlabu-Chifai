require 'spec_helper'

describe "/visit_types/edit.html.erb" do
  include VisitTypesHelper

  before(:each) do
    assigns[:visit_type] = @visit_type = stub_model(VisitType,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit visit_type form" do
    render

    response.should have_tag("form[action=#{visit_type_path(@visit_type)}][method=post]") do
      with_tag('input#visit_type_name[name=?]', "visit_type[name]")
      with_tag('textarea#visit_type_notes[name=?]', "visit_type[notes]")
    end
  end
end
