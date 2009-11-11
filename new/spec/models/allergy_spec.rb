require 'spec_helper'

describe Allergy do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Allergy.create!(@valid_attributes)
  end
end
