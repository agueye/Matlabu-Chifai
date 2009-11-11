require 'spec_helper'

describe "/conditions/edit.html.erb" do
  include ConditionsHelper

  before(:each) do
    assigns[:condition] = @condition = stub_model(Condition,
      :new_record? => false,
      :name => "value for name",
      :notes => "value for notes"
    )
  end

  it "renders the edit condition form" do
    render

    response.should have_tag("form[action=#{condition_path(@condition)}][method=post]") do
      with_tag('input#condition_name[name=?]', "condition[name]")
      with_tag('textarea#condition_notes[name=?]', "condition[notes]")
    end
  end
end
