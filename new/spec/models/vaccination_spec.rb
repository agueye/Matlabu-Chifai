require 'spec_helper'

describe Vaccination do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Vaccination.create!(@valid_attributes)
  end
end
