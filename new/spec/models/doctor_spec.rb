require 'spec_helper'

describe Doctor do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Doctor.create!(@valid_attributes)
  end
end
