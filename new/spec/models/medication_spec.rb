require 'spec_helper'

describe Medication do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Medication.create!(@valid_attributes)
  end
end
