require 'spec_helper'

describe "/conditions/new.html.erb" do
  include ConditionsHelper

  before(:each) do
    assigns[:condition] = stub_model(Condition,
      :new_record? => true,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders new condition form" do
    render

    response.should have_tag("form[action=?][method=post]", conditions_path) do
      with_tag("input#condition_name[name=?]", "condition[name]")
      with_tag("textarea#condition_notes[name=?]", "condition[notes]")
    end
  end
end
